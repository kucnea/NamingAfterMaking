package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HomeController{
	
	@RequestMapping("index")
	public String index() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "root.index";
	}

}
 