package com.web.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.web.entity.player.Player;

public class AuthorizationInterceptor extends HandlerInterceptorAdapter implements SessionNames {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("Authorization preHandle");
		
		Cookie lgCookie = WebUtils.getCookie(request, SessionNames.loginCookie); 
		if(lgCookie == null) response.sendRedirect("/player/login");
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(18000);
		
		Player player = (Player) session.getAttribute(login);
		session.setAttribute("player", player);
//		System.out.println(p.toString());
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mv) throws Exception {

//		HttpSession session = request.getSession();
//		session.setMaxInactiveInterval(18000);
		System.out.println("Authorization postHandle");
		
	}
	
	
	
}