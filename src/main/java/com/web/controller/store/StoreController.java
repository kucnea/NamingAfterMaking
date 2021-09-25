package com.web.controller.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/")
public class StoreController {

	@RequestMapping("basket")
	public String basket() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "store.basket";
	}

	@RequestMapping("npc")
	public String npc() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "store.npc";
	}
	
	@RequestMapping("ptp")
	public String ptp() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "store.ptp";
	}
	
	@RequestMapping("storelist")
	public String storeList() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "store.storeList";
	}
	
	
}
