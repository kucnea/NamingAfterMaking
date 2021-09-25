package com.web.controller.rank;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rank/")
public class RankController {

	@RequestMapping("page")
	public String rankPage() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "rank.page";
	}
	
	
}
