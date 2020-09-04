package com.nemo.user.talk.handler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nemo.user.sign.signup.vo.UserBaseVO;

@Controller("talkHandler")
public class TalkHandler extends TextWebSocketHandler {
	
	private Map<Integer, WebSocketSession> sessionMap = new ConcurrentHashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Map<String, Object> tempMap = session.getAttributes();
		
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) {
			System.out.println("유저정보없음");
			session.close();
			return;
		}
		
		sessionMap.put(user.getUserNo(), session);
		System.out.println("sessionMap : " + sessionMap);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("{}로부터 {} 받음" + session.getId() + message.getPayload());
		for(Integer key : sessionMap.keySet()) {
			WebSocketSession sess = sessionMap.get(key);
			sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed 실행");
		Map<String, Object> tempMap = session.getAttributes();
		UserBaseVO user = (UserBaseVO)tempMap.get("user");
		if(user == null) return;
		int userNo = user.getUserNo();
		sessionMap.remove(userNo);
		System.out.println(sessionMap);
		System.out.println("{} 연결 끊김 " + session.getId());
		session.close();
	}
	
}
