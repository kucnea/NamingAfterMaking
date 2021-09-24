package com.web.controller.join;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join/")
public class JoinController {

	@RequestMapping("page")
	public String index() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "join.page";
	}
	
	
}
