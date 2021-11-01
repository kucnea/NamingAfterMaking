package com.web.webSocket.handler;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.web.entity.player.Player;
import com.web.interceptor.SessionNames;
import com.web.util.chatBot.ChatBot;

public class WebSocketHandler extends TextWebSocketHandler{ // 스트리밍은 바이너리
	
	private Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	private Map<String, WebSocketSession> chatSessions = new HashMap<String, WebSocketSession>();
	private Map<String, WebSocketSession> botChatSessions = new HashMap<String, WebSocketSession>();
//	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnetctionEstablished : "+session);
//		sessions.add(session);
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
		
		//json이 제일 좋다함. cmd, player2, player1, String, String 
		// 1st protocol : reply, user2, user1, gongTitle, gongIdx
		// 2nd portocol : chat, 접속자, 대상자, message, status ( 0 : 접속, 1 : 실시간채팅, 2 : 관리자 챗봇 )
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			if(strs != null && strs.length == 5) {
				String cmd = strs[0];
				String user2 = strs[1];
				String user1 = strs[2];
				String string1 = strs[3];
				String string2 = strs[4];
				
//				if(!replyWriter.equals(boardWriter)) {
//					WebSocketSession boardWriterSession = userSessions.get(boardWriter);
//					if(boardWriterSession != null && cmd.equals("reply")) {
//						TextMessage tmsg = new TextMessage("<a href='/gong/gongdetail?gongIdx="+gongIdx+"'>"+replyWriter+"님이 "+title+" 게시글에 댓글을 달았습니다. ( 클릭시 이동 )</a>");
//						boardWriterSession.sendMessage(tmsg);
//					}
//				}
				
				//reply, replyWriter, boardWriter, title, gongIdx
				if(cmd.equals("reply") && !user2.equals(user1)) {
					WebSocketSession boardWriterSession = userSessions.get(user1);
					if(boardWriterSession != null) {
						TextMessage tmsg = new TextMessage("1<a href='/gong/gongdetail?gongIdx="+string2+"'>"+user2+"님이 "+string1+" 게시글에 댓글을 달았습니다. ( 클릭시 이동 )</a>");
						boardWriterSession.sendMessage(tmsg);
					}
				}
				
				//id는 13자 까지
				//chat, 접속자, 대상자, message, status ( 0 : 접속, 1 : 실시간채팅, 2 : 관리자 챗봇 )
				if(cmd.equals("chat")) {
					if(user2.equals("unknown")) user2=user2+senderId.substring(0,5);
						
					WebSocketSession mySession = userSessions.get(senderId);
					if(string2.equals("0")) {
						TextMessage startMsg = new TextMessage("2"+"<a style='text-align:left; color:orange; font-size:1.2em;'>"+user2+"</a>"+"님 반갑습니다. 채팅에 접속했습니다.\n");
						
						chatSessions.put(user2, session);
						
						mySession.sendMessage(startMsg);
					}else if(string2.equals("1")){
						
						TextMessage chatMsg = new TextMessage(string1);
						System.out.println("user1 : "+user1);
						if(!user1.equals("all")) {		// 귓속말 ( Direct Message )
							System.out.println("DM stage");
							
							WebSocketSession urSession = chatSessions.get(user1);
							if(urSession == null) mySession.sendMessage(new TextMessage("2"+"<a style='text-align:left; color:green;'>"+user2+"님 DM대상이 없습니다. 다시 한 번 확인해주세요."+"</a>")); 
							else {
								mySession.sendMessage(new TextMessage("2"+"<a style='text-align:left; color:green;'>"+user2+" : "+string1+"</a>"));
								urSession.sendMessage(new TextMessage("2"+"<a style='text-align:left; color:green;'>"+user2+" : "+string1+"</a>"));
							}
							
						}else {
							System.out.println("OpenMessage stage");
							Iterator<String> sessionIds = chatSessions.keySet().iterator();
							System.out.println("OpenMessage stage2");
							String sessionId = "";
							while(sessionIds.hasNext()) {
								sessionId = sessionIds.next();
								if(sessionId.equals(user2)) chatSessions.get(sessionId).sendMessage(new TextMessage("2"+"<a style='text-align:left; color:orange;'>"+user2+" : "+string1+"</a>")); 
								else {
									if(chatSessions.get(sessionId).isOpen()) {
										chatSessions.get(sessionId).sendMessage(new TextMessage("2"+"<a style='text-align:left;'>"+user2+" : "+string1+"</a>"));
									}
//									else {		// 채팅 도중 로그인시 문제 발생
//										chatSessions.remove(sessionId);
//									}
										
								}
							}
						}
						
					}else if(string2.equals("2")) {
						//chat, 접속자, adminBot, message, 2
						
						TextMessage chatMsg = new TextMessage(string1);
						if(user1.equals("admin")) {
							
							System.out.println("bot stage");
							
							if(mySession != null) {
								
								String result = new ChatBot().start(string1);
								mySession.sendMessage(new TextMessage("3"+"<a style='text-align:left; color:orange;'>"+user2+" : "+string1+"</a>"+"<br>"+"<a style='text-align:left; color:green;'>admin : "+result+"</a>"));
								
							}
							
							
						}
						
					}
					
					
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
