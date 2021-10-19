package com.web.controller.gong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.gong.Gong;
import com.web.service.GongService;

@Controller
@RequestMapping("/gong/")
public class GongController {

	@Autowired GongService gongService;
	
	
	@RequestMapping("gonglist")
	public String gongList(Model model) {	//url과 method명을 맞추는 것이 관리에 용이
		
		System.out.println("gong Controller : gongList stage");
		
		List<Gong> list = gongService.searchAll();
		if(list==null) model.addAttribute("list", list);
		else model.addAttribute("msg", "조회된 결과가 없습니다.");
		
		return "gong.gongList";
	}
	
	
}
