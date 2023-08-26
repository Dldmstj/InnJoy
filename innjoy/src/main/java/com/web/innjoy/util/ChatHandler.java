package com.web.innjoy.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler{

	// 접속한 채팅 소켓 세션 설정(접속자 저장)
	private Map<String, WebSocketSession> users = new ConcurrentHashMap();

	@Override	// 접속
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		System.out.println(session.getId()+"님 접속했습니다.");
		// 접속한 사용자 id와 session을 누적해서 추가 처리
		users.put(session.getId(),session);
	}

	// 특정한 접속자가 보낸 메시지를 socket서버에 접속한 모든 사용자에게 전송
	// push 방식으로 각 사용자들에 웹으로 메시지를 전달 처리
	@Override	// 메시지 전송
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		System.out.println(session.getId()+"님이 전송한 메시지: " + message.getPayload());
		for(WebSocketSession ws:users.values()) {
			ws.sendMessage(message);
		}
	}

	@Override	// 종료
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println(session.getId()+"님의 접속이 종료되었습니다.");
		// 전역변수로 되어있는 사용자 명단에서 삭제 처리
		users.remove(session.getId());
	}

	@Override	// 에러
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println(session.getId()+"님 에러가 발생했습니다. 에러내용: " + exception.getMessage());
	}



}
