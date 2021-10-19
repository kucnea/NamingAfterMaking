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
	
	
	@RequestMapping("board")
	public String gongBoard(Model model) {	//url과 method명을 맞추는 것이 관리에 용이
		
		List<Gong> list = gongService.searchAll();
		model.addAttribute("list", list);
		
		return "gong.board";
	}
	
	
}
