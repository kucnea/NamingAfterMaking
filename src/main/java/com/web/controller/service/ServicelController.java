package com.web.controller.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service/")
public class ServicelController {

	@RequestMapping("privacypolicy")
	public String privacyPolicy() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "service.privacyPolicy";
	}
	@RequestMapping("contact")
	public String contact() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "service.contact";
	}
	@RequestMapping("faq")
	public String faq() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "service.faq";
	}
	@RequestMapping("tnc")
	public String tnc() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "service.tnc";
	}
	
	
}
