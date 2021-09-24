package com.web.controller.inGame;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ingame/")
public class InGameController {

	@RequestMapping("gamescreen")
	public String index() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "ingame.gameScreen";
	}
	
	
}
