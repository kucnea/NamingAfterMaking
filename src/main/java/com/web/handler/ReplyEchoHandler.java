package com.web.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.web.entity.player.Player;
import com.web.interceptor.SessionNames;

public class ReplyEchoHandler extends TextWebSocketHandler{ // 스트리밍은 바이너리
	
	private Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnetctionEstablished : "+session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);

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
		String senderId = getId(session);
		
		//json이 제일 좋다함.
		//protocol : cmd, 댓글작성자, 게시글작성자,gongTitle ( reply, user2, user1, gongTitle )
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String title = strs[3];
				
				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
				if(boardWriterSession != null && cmd.equals("reply")) {
					TextMessage tmsg = new TextMessage(replyWriter+"님이 "+title+" 게시글에 댓글을 달았습니다.");
					boardWriterSession.sendMessage(tmsg);
				}
			}
			
		}
		
		
		
		//모든 유저에게 전송, 실시간 단체 채팅
//		for(WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderId +" : "+message.getPayload()));
//		}
		
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
	
	
	private String getId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		Player player = (Player) httpSession.get(SessionNames.login);
		if(player == null) return session.getId();
		else return player.getPId();
		
	}

}
