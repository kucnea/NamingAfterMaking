package com.web.controller.toDeveloper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/todeveloper/")
public class ToDevelController {

	@RequestMapping("introduce")
	public String dIntroduce() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "toDeveloper.introduce";
	}

	@RequestMapping("mtm")
	public String dMtm() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "toDeveloper.mtm";
	}
	
	@RequestMapping("reportboard")
	public String dReportBoard() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "toDeveloper.reportBoard";
	}
	
	
}
