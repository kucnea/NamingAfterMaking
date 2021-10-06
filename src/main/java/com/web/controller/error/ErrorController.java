package com.web.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error/")
public class ErrorController {

	@RequestMapping("unknown")
	public String unknown() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "error.unknown";
	}

	@RequestMapping("404")
	public String err404() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "error.err404";
	}
	
	
}
