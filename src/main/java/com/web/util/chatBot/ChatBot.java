package com.web.util.chatBot;

public class ChatBot {

	public String start(String m) {
		
		if(m.contains("안녕")) {
			
			if(m.length()<8) {
				
				String[] arr = {"안녕하세요? 관리자 대리 챗봇입니다.", "안녕하세요 :) 오늘 하루 편안하신가요?"};
				int a = (int) Math.random()*2;
				return arr[a];
				
			}else {
				
				return "죄송해요 말씀이 길어서 이해하지 못했네요 ㅠㅠ 안녕에 대한 이야기 인가요?";
				
			}
			
		}else if(m.contains("뭐해")) {
			
			return "뭐하냐고 물으신거라면 저는 그저 기다리고 있습니다. 인공지능이 제일 잘 하는 것은 기다리는 것이니까요.";
		}else {
			
			return "죄송하지만 말씀을 이해하지 못했어요. 멍청한 제 개발자가 성장할때까지 조금만 기다려주시겠어요?";
		}
		
	}

}
