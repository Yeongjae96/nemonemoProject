package com.nemo.user.talk.handler;

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
import com.google.gson.JsonParser;
import com.nemo.common.util.AuthUtil;
import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.talk.service.UserMsgService;
import com.nemo.user.talk.vo.MessageVO;
import com.nemo.user.talk.vo.UserBaseMsgVO;

@Controller("talkHandler")
public class TalkHandler extends TextWebSocketHandler {
	
	private Map<Integer, WebSocketSession> talkListMap = new ConcurrentHashMap<>();
	private Map<Integer, Map<Integer, WebSocketSession>> talkRoomMap = new ConcurrentHashMap<>();
	private Map<Integer, WebSocketSession> personalMap = new ConcurrentHashMap<>();
	
	@Autowired
	private UserMsgService msgService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> tempMap = session.getAttributes();
		
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) {
			System.out.println("유저정보없음");
			session.close();
			return;
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		int userNo = AuthUtil.getCurrentUserNo();
		if(userNo == -1 ) return;
		
		JsonElement element = JsonParser.parseString(message.getPayload());
		String request = element.getAsJsonObject().get("request").getAsString();
		int sender = element.getAsJsonObject().get("sender").getAsInt();
		int  receiver = element.getAsJsonObject().get("receiver").getAsInt();
		
		switch(request) {
		case "enterTalkList":
			talkListMap.put(userNo, session);
			System.err.println("talkListMap : " + talkListMap);
			System.err.println("리스트 방 입장");
			break;
		case "enterTalkRoom":
			personalMap.put(receiver, session);
			talkRoomMap.put(userNo, personalMap);
			System.err.println("talkRoomMap : " + talkRoomMap);
			System.err.println("대화 방 입장");
			break;
		case "sendMsg":
			String data = element.getAsJsonObject().get("data").getAsString();
			Gson gson = new GsonBuilder().create();
			UserBaseMsgVO json = gson.fromJson(data, UserBaseMsgVO.class);
			msgService.recordMessage(json);
			break;
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed 실행");
		Map<String, Object> tempMap = session.getAttributes();
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) return;
		int userNo = user.getUserNo();
		talkListMap.remove(userNo);	
		talkRoomMap.remove(userNo);
		System.out.println("{} 연결 끊김 " + session.getId());
		System.err.println("talkListMap : " + talkListMap);
		System.err.println("talkRoomMap : " + talkRoomMap);
	}
	
}
