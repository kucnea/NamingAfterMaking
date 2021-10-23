package com.web.controller.gong;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		//읽기전 조회수 증가 처리
		Gong gong = gongService.searchOne(gongIdx);
		gong.setGongCnt(gong.getGongCnt()+1);		
		gongService.update(gong);
		gong = gongService.searchOne(gongIdx);
		model.addAttribute("gong",gong);
		
		Gong gong1 = gongService.searchOne(gongIdx-1);
		Gong gong2 = gongService.searchOne(gongIdx+1);
		
		if(gong1!=null) model.addAttribute("gong1",gong1);
		if(gong2!=null) model.addAttribute("gong2",gong2);
		
		return "gong.gongDetail";
	}
	
	@RequestMapping("gongupdate")
	public String gongUpdate(@RequestParam("gongIdx") int gongIdx, Model model) {
		
		Gong gong = gongService.searchOne(gongIdx);
		model.addAttribute("gong",gong);
		
		return "gong.gongUpdate";
//		return "redirect:gongdetail?gongIdx="+gongIdx;
	}
	
	
	@PostMapping("gongupdatesubmit")
	public String gongUpdateSubmit(Model model, @ModelAttribute("gong") Gong gong,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Player player = (Player) session.getAttribute("player");
		
		System.out.println("gongUpdateSubmit Stage");
		System.out.println("gong toString : "+gong.toString());
		
		gongService.update(gong);
		
//		Gong gongUpdated = gongService.searchOne(gong.getGongIdx());
//		gongUpdated.setGongTitle(gong.getGongTitle());
//		gongUpdated.setGongContent(gong.getGongContent());
//		gongUpdated.setGongWTime(new Date());
//		gongService.update(gongUpdated);
//		gongUpdated = gongService.searchOne(gong.getGongIdx());
//		model.addAttribute("gong",gongUpdated);
		
		
		
		return "redirect:gongdetail?gongIdx="+gong.getGongIdx();
	}
	
	@RequestMapping("gongdelete")
	public String gongDelete(@RequestParam("gongIdx") int gongIdx) {
		
		gongService.delete(gongIdx);
		
		return "redirect:gonglist";
	}
	
}
