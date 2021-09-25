package com.web.controller.realtime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/realtime/")
public class RealtimeController {

	@RequestMapping("chat")
	public String userChat() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "realtime.chat";
	}
	
	
}
