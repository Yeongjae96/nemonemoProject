package com.nemo.user.talk.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.talk.service.UserMsgService;
import com.nemo.user.talk.service.UserTalkService;
import com.nemo.user.talk.vo.UserBaseMsgVO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Controller("talkHandler")
public class TalkHandler extends TextWebSocketHandler {
	
	private Map<Integer, WebSocketSession> talkListMap = new ConcurrentHashMap<>();
	private Map<Integer, Map<Integer, WebSocketSession>> talkRoomMap = new ConcurrentHashMap<>();
	
	@Autowired
	private UserMsgService msgService;
	
	@Autowired
	private UserTalkService talkService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> tempMap = session.getAttributes();
		
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) {
			session.close();
			return;
		}
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		UserBaseVO user = (UserBaseVO)session.getAttributes().get("user");
		if(user == null) return;
		int userNo = user.getUserNo();
		
		JsonElement element = JsonParser.parseString(message.getPayload());
		String request = element.getAsJsonObject().get("request").getAsString();
		int sender = element.getAsJsonObject().get("sender").getAsInt();
		JsonElement receiverObj = element.getAsJsonObject().get("receiver");
		int receiver = receiverObj != null ? receiverObj.getAsInt() : -1;
		
		switch(request) {
		case "enterTalkList":
			talkListMap.put(userNo, session);
			System.err.println("목록에 들어옴 : " + talkListMap);
			break;
		case "enterTalkRoom":
			Map<Integer, WebSocketSession> personalMap;
			if(talkRoomMap.get(receiver) == null || talkRoomMap.get(receiver).size() == 0) {
				personalMap = new ConcurrentHashMap<>();
				personalMap.put(sender, session);
				talkRoomMap.put(receiver, personalMap);
			} else {
				personalMap = talkRoomMap.get(receiver);
				personalMap.put(sender, session);
			}
			
			if(talkRoomMap.get(sender) != null && talkRoomMap.get(sender).get(receiver) != null) {
				TextMessage confirmResponse = new TextMessage("{\"response\":\"confirmMyMsg\"}");
				synchronized (talkRoomMap.get(sender).get(receiver)) {
					talkRoomMap.get(sender).get(receiver).sendMessage(confirmResponse); // 대화하고있는 상대방
					session.sendMessage(confirmResponse); // 자기자신
				}
			}
			if(talkRoomMap.get(receiver) != null && talkRoomMap.get(receiver).get(sender) != null) {
				TextMessage confirmResponse = new TextMessage("{\"response\":\"confirmMsg\"}");
				synchronized (talkRoomMap.get(receiver).get(sender)) {
					talkRoomMap.get(receiver).get(sender).sendMessage(confirmResponse); // 대화하고있는 상대방
				}
			}
			UserBaseMsgVO vo = new UserBaseMsgVO();
			vo.setMsgReceiver(sender);
			vo.setMsgSender(receiver);
			System.out.println(msgService.confirmMsg(vo) + "개");
			break;
			
		case "sendMsg":
			JsonObject data = element.getAsJsonObject().get("data").getAsJsonObject();
			Gson gson = new GsonBuilder().create();
			UserBaseMsgVO json = gson.fromJson(data, UserBaseMsgVO.class);
			
			if(talkRoomMap.get(sender) != null && talkRoomMap.get(sender).get(receiver) != null) {
				json.setMsgConfirmSt("Y");
				data.remove("msgConfirmSt");
				data.addProperty("msgConfirmSt", "Y");
			}
			
			//등록
			msgService.recordMessage(json);
			
			String responseJson = JsonObjBuilder.makeJsonObject(
					new JsonEntry("response","sendMsg"),
					new JsonEntry("sender", sender),
					new JsonEntry("receiver", receiver))
					.addObject("data", data)
					.build();
			
			TextMessage response = new TextMessage(responseJson);
			
			// 상대방에게 보내기
			if(talkRoomMap.get(sender) != null && talkRoomMap.get(sender).get(receiver) != null) {
				synchronized (talkRoomMap.get(sender).get(receiver)) {
					talkRoomMap.get(sender).get(receiver).sendMessage(response);
				}
				synchronized (session) {
					session.sendMessage(new TextMessage("{\"response\":\"confirmMsg\"}"));
				}
			}

			sendTalkList(sender, response);
			sendTalkList(receiver, response);
			break;
		case "confirmTalkList":
			String responseText = JsonObjBuilder.makeJsonObject(
					new JsonEntry("response", "refreshConfirmMark"),
					new JsonEntry("sender", sender),
					new JsonEntry("receiver", receiver)).build();
			
			sendTalkList(sender, new TextMessage(responseText));
			break;	
		case "deleteTalk":
			Map<String, Object> param = new HashMap<>();
			
			JsonElement talkNoObj = element.getAsJsonObject().get("talkNo");
			int talkNo = talkNoObj != null ? talkNoObj.getAsInt() : -1;

			JsonElement regDateObj = element.getAsJsonObject().get("regDate");
			long regDate = regDateObj != null ? regDateObj.getAsLong() : -1;
			System.out.println(regDate);
			
			param.put("talkNo", talkNo);
			param.put("currentUserNo", sender);
			param.put("opponentUserNo", receiver);
			param.put("regDate", regDate);
			
			talkService.exitTalk(param);
			
			if(talkListMap.containsKey(sender)) {
				String exitTalkResponse = JsonObjBuilder.makeJsonObject(
							new JsonEntry("response", "deleteTalkRoom"),
							new JsonEntry("sender", sender),
							new JsonEntry("receiver", receiver)
						).build();
				sendTalkList(sender, exitTalkResponse);
			}
			break;
		case "exitTalkList":
			WebSocketSession exitTalk = talkListMap.get(sender);
			talkListMap.remove(sender);
			exitTalk.close();
			break;
		case "exitTalkRoom":
			Map<Integer, WebSocketSession> joinRoom= talkRoomMap.get(receiver);
			if(joinRoom != null && joinRoom.size() != 0) {
				WebSocketSession sess = joinRoom.get(sender);
				joinRoom.remove(sender);
				if(sess != null && sess.isOpen()) sess.close();
			}
			break;
		default: 
			break;
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> tempMap = session.getAttributes();
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) return;
		System.err.println("talkListMap	: " + talkListMap);
		System.err.println("talkRoomMap : " + talkRoomMap);
	}
	
	// list목록에 들어와있으면 보내주고 아님 말고
	private synchronized void sendTalkList(int no, TextMessage message) throws Exception {
		if(talkListMap.get(no) != null && talkListMap.get(no).isOpen()) talkListMap.get(no).sendMessage(message);
	}
	// list목록에 들어와있으면 보내주고 아님 말고
	private synchronized void sendTalkList(int no, String message) throws Exception {
		if(talkListMap.get(no) != null && talkListMap.get(no).isOpen()) talkListMap.get(no).sendMessage(new TextMessage(message));
	}
	
	@Data
	@AllArgsConstructor
	private static class JsonEntry{
		private String key;
		private String value;
		
		public JsonEntry(String key, int value) {
			this.key = key;
			this.value = String.valueOf(value);
		}
	}
	
	/* GSON을 이용해서 JSON을 좀더 쉽게 만들고 싶은 나의 욕망의 담긴 클래스 */
	private static class JsonObj {
		private JsonObject obj;
		private static Gson gson;
		
		static {
			gson = new Gson();
		}
		
		public JsonObj() {
			obj = new JsonObject();
		}
		
		private JsonObj addProperty(String key, String value) {
			obj.addProperty(key, value);
			return this;
		}
		
		private JsonObj addObject(String key, JsonObject obj) {
			this.obj.add(key, obj);
			return this;
		}
		
		private String build() {
			return gson.toJson(this.obj);
		}
	}
	
	/* GSON을 이용해서 JSON을 좀더 쉽게 만들고 싶은 나의 욕망의 담긴 클래스 */
	private static class JsonObjBuilder {
		private static JsonObj makeJsonObject(JsonEntry... entrys) {
			JsonObj json = new JsonObj();
			for(JsonEntry entry : entrys) {
				json.addProperty(entry.getKey(), entry.getValue());
			}
			return json;
		}
	}
	
	
	
}
