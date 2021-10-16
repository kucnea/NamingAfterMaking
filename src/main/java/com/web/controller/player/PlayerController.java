package com.web.controller.player;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.entity.player.Player;
import com.web.service.PlayerService;

@Controller
@RequestMapping("/player/")
public class PlayerController {

	
	@Autowired PlayerService playerService;
	
	//엔티티 팩토리 싱글톤
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpaoracle");

	
	
	
	
	
	@RequestMapping("login")
	public String loginPage() {	//url과 method명을 맞추는 것이 관리에 용이
	
		return "player.login";
	}
	
	
//	@RequestMapping(value="logedin", method = RequestMethod.POST)
	@PostMapping("logedin")
	public String logedIn(@ModelAttribute("player") Player player,Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("pId", player.getpId());
		
		System.out.println("logedin Controller // pId : "+player.getpId()+", pPw : "+player.getpPw());
		
//		playerService.login(player);
		
		return "player.logedin";
	}
	
	@RequestMapping("join")
	public String joinPage() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "player.join";
	}
	
	@PostMapping("create")
//	@RequestMapping(value="create", method = RequestMethod.POST)
	public String create(@ModelAttribute("player") Player player,Model model) {
		
		System.out.println("insert Player stage : "+player.toString());
		model.addAttribute("player",player);
		
		int result = playerService.join(player);
		
		if(result==-1) model.addAttribute("result",false); // 이거갖고 자바스크립트 사용해서 결과창 바꾸기.
		else model.addAttribute("result",true);
			
		return "player.joinComplete";
	}

	
	@RequestMapping("appointment")
	public String appointment() {	//url과 method명을 맞추는 것이 관리에 용이
		
		return "player.memberAppointment";
	}
}
