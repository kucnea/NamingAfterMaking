package com.web.controller.member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("create")
	public String create(Model model,@ModelAttribute("member") Member member) {	//url과 method명을 맞추는 것이 관리에 용이
		
		System.out.println("input member to join : "+member.toString());
		model.addAttribute("member",member);
		
		return "member.joinComplete";
	}
	
	@RequestMapping("appointment")
	public String appointment() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "member.memberAppointment";
	}
	
	
}
