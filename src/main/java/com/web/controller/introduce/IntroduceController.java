package com.web.controller.introduce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/introduce/")
public class IntroduceController {

	@RequestMapping("nam")
	public String nam() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "introduce.NAM";
	}
	
	
}
