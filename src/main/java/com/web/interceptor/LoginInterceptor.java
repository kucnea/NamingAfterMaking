package com.web.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.entity.player.Player;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(18000);
		System.out.println("login preHandle");
		
		if(session.getAttribute(login)!=null) session.removeAttribute(login);
		

		
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mv) throws Exception {

		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(18000);
		System.out.println("login postHandle");
		
//		Object player = mv.getModelMap().get("player");
		Player player = (Player) mv.getModelMap().get("player");
		
		Object remember = session.getAttribute("remember");
		if(player!=null) {
			session.setAttribute(login, player);
			session.setAttribute("player", player);
			if(remember!=null) {
				Cookie lgCookie = new Cookie(loginCookie, player.getPId());
				lgCookie.setPath("/");
				lgCookie.setMaxAge(24*60*60);
				response.addCookie(lgCookie);
			}
			
			//쿠키로 로그인 검증했던 코드
//			Cookie lgCookie = new Cookie(loginCookie, session.getId());
			
		}
		session.removeAttribute("remember");
		mv.getModelMap().remove("player"); 
		mv.getModelMap().remove("p"); 
		mv.getModelMap().remove("result");
		
	}
	
	
	
}
