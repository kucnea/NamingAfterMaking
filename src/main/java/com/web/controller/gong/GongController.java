package com.web.controller.gong;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.entity.gong.Gong;
import com.web.entity.player.Player;
import com.web.service.GongService;

@Controller
@RequestMapping("/gong/")
public class GongController {

	@Autowired GongService gongService;
	
	
	@RequestMapping("gonglist")
	public String gongList(Model model) {	//url과 method명을 맞추는 것이 관리에 용이
		
		System.out.println("gong Controller : gongList stage");
		
		List<Gong> list = gongService.searchAll();
		
		System.out.println("list의 사이즈 :"+list.size());
		System.out.println(list.get(0).getPlayer().getPNick());
		
		if(list.size()!=0) model.addAttribute("list", list);
		else model.addAttribute("msg", "조회된 결과가 없습니다.");
		
		return "gong.gongList";
	}
	
	@RequestMapping("gongwrite")
	public String gongWrite(Model model) {
		
		
		
		return "gong.gongWrite";
	}
	
	@PostMapping("gongsubmit")
	public String gongSubmit(Model model, @ModelAttribute("gong") Gong gong,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		boolean result = gongService.write(gong,player);
		
		if(result) {
			return "redirect:gonglist";	
		}else {
			return "gong.gongWrite";
		}
		
	}
	
	@RequestMapping("gongdetail")
	public String gongDetail(@RequestParam("gongIdx") int gongIdx, Model model) {
		
		System.out.println("gongIdx : "+gongIdx);
		
		Gong gong = gongService.searchOne(gongIdx);
		model.addAttribute("gong",gong);
		
		return "gong.gongDetail";
	}
}
