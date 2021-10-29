package com.web.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler{ // 스트리밍은 바이너리
	
//	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
	
	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnetctionEstablished : "+session);
		sessions.add(session);

//		System.out.println("세션아이디 :"+session.getId()+" 입장.");
//		
//		Iterator<String> sessionIds = sessions.keySet().iterator();
//		
//		String sessionId = "";
//		while(sessionIds.hasNext()) {
//			sessionId = sessionIds.next();
//			sessions.get(sessionId).sendMessage(new TextMessage("["+session.getId()+"] 입장."));
//		}
//		
//		sessions.put(session.getId(), session);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		System.out.println("handleTextMessage : "+session+" :"+message);
		String senderId = session.getId();
		
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId +" : "+message.getPayload()));
		}
		
//		System.out.println(session.getId()+"이(가) 메세지 전송.");
//		
//		Iterator<String> sessionIds = sessions.keySet().iterator();
//		
//		String sessionId = "";
//		while(sessionIds.hasNext()) {
//			sessionId = sessionIds.next();
//			sessions.get(sessionId).sendMessage(new TextMessage(session.getId()+" : "+message.getPayload()));
//		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		System.out.println("afterConnectionClosed : "+session+" : "+status);
//		System.out.println("세션아이디 : "+session.getId()+" 퇴장.");
//		
//		sessions.remove(session.getId());
//		
//		Iterator<String> sessionIds = sessions.keySet().iterator();
//		
//		String sessionId = "";
//		while(sessionIds.hasNext()) {
//			sessionId = sessionIds.next();
//			sessions.get(sessionId).sendMessage(new TextMessage("["+session.getId()+"] 퇴장."));
//		}
		
	}
	

}
