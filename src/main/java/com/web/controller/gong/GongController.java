package com.web.controller.gong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gong/")
public class GongController {

	@RequestMapping("board")
	public String gongBoard() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "gong.board";
	}
	
	
}
