package com.web.controller.player;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.web.entity.player.Player;
import com.web.interceptor.SessionNames;
import com.web.service.PlayerService;

@Controller
@RequestMapping("/player/")
public class PlayerController {

	
	@Autowired PlayerService playerService;
	
	//엔티티 팩토리 싱글톤
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpaoracle");

	@RequestMapping("login")
	public String loginPage(HttpServletRequest request,Model model) {	//url과 method명을 맞추는 것이 관리에 용이
		
		Cookie lgCookie = WebUtils.getCookie(request, SessionNames.loginCookie);
		if(lgCookie!=null) {
			String pId = lgCookie.getValue();
			model.addAttribute("pId",pId);
			model.addAttribute("checked","check");
		}else {
			model.addAttribute("checked","uncheck");	
		}
		
		return "player.login";
	}
	
	
	@RequestMapping("mypage")
	public String logedIn() {
		
		return "player.myPage";
	}
	
//	@RequestMapping(value="logedin", method = RequestMethod.POST)
	@PostMapping("logedin")
	public String logedIn(
			@ModelAttribute("player") Player player,
			@RequestParam("remember") @Nullable String remember,
			Model model, 
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println("logedin Controller insert player // pId : "+player.getPId()+", pPw : "+player.getPPw());
		
		player = playerService.login(player); //player로 그대로 사용하는 경우 하기 조건문에서 null이 제대로 걸러지지 않을거같음.
		
		//Id 기억하기
		if(remember!=null) session.setAttribute("remember", remember);
		else session.setAttribute("remember", "unremember");
			
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
	
	@RequestMapping("valid")
	public String valid(
			@RequestParam("pId") @Nullable String pId,
			@RequestParam("pNick") @Nullable String pNick,
			@RequestParam("pPw") @Nullable String pPw,
			Model model) {
		System.out.println("valid stage");
		System.out.println("pId : "+pId);
		pId = playerService.valid(pId);
		if(pId.startsWith("@")) {
			pId = pId.substring(1,pId.length());
			model.addAttribute("result1", 1);	// 중복되진 않으나, 규약에 맞지 않아 추천 Id 제공
		}else if(pId.startsWith("#")) {
			pId = pId.substring(1,pId.length());
			model.addAttribute("result1", 2);	// 중복이거나, 규약에 맞지 않아 추천 Id 제공
		}else if(pId.startsWith("$")) {
			pId = "";
			model.addAttribute("result1", 3);	// 추천 아이디 알고리즘의 100가지 이상의 시도가 있었으나 사용중으로 추천 Id 제공불가
		}else {
			model.addAttribute("result1",0);		// 사용가능
		}
		model.addAttribute("pId1",pId);
		model.addAttribute("pNick1",pNick);
		model.addAttribute("pPw1",pPw);
		
		
//		return "redirect:join";
		return "player.join";
	}
}
