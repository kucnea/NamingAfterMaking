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
	
	
	@RequestMapping("mypage")
	public String logedIn() {
		
		return "player.myPage";
	}
	
//	@RequestMapping(value="logedin", method = RequestMethod.POST)
	@PostMapping("logedin")
	public String logedIn(@ModelAttribute("player") Player player,Model model, HttpServletRequest request) {
		
//		HttpSession session = request.getSession();
		
		System.out.println("logedin Controller insert player // pId : "+player.getPId()+", pPw : "+player.getPPw());
		
		player = playerService.login(player); //player로 그대로 사용하는 경우 하기 조건문에서 null이 제대로 걸러지지 않을거같음.
		
//		System.out.println("player Controller : "+player.toString());
//		System.out.println("player Controller : "+p.toString());
		
		if(player!=null)	{
			System.out.println("logedin Controller output player // pId : "+player.getPId()+", pPw : "+player.getPPw());
			model.addAttribute("player", player);
			model.addAttribute("player1", player); // 세션에서랑 모델에서 변수명이 꼬이는지 로그인 후 화면에서만 player인자값이 안나옴
			model.addAttribute("result1","t");
			return "player.logedin";
		}else {
			System.out.println("logedin Controller output player // result : null");
			model.addAttribute("result1","f");
			return "player.login";
		}

//		return "player.logedin";
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
	
	@RequestMapping("logout")
	public String logout() {
		
		return "player.login";
	}
}
