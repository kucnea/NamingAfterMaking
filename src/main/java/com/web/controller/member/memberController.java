package com.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class memberController {

	@RequestMapping("login")
	public String loginPage() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "member.login";
	}
	
	@RequestMapping("join")
	public String joinPage() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "member.join";
	}
	
	
}
