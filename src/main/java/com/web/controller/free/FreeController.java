package com.web.controller.free;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/free/")
public class FreeController {

	@RequestMapping("freelist")
	public String freeBoard() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "free.freeList";
	}
	
	
}
