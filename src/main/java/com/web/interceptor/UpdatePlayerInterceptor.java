package com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.entity.player.Player;

public class UpdatePlayerInterceptor extends HandlerInterceptorAdapter implements SessionNames{
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mv) throws Exception {

		System.out.println("UpdatePlaterInterceptor postHandle");
		
		HttpSession session = request.getSession();
		Player player = (Player) mv.getModelMap().get("player");
		System.out.println("player.getPNick() : "+player.getPNick());
		session.setAttribute("player", player);

		session.setMaxInactiveInterval(18000);
		
		
	}
	
}
