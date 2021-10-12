package com.web.interceptor;

import javax.annotation.Nullable;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println("preHandle has");
		
		if(session.getAttribute(login)!=null) session.removeAttribute(login);
		

		
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mv) throws Exception {

		HttpSession session = request.getSession();
		System.out.println("post Handle has : "+session.getAttribute("pId"));
		
		Object player = mv.getModelMap().get("player");
		if(player!=null) {
			session.setAttribute(login, player);
			
			Cookie lgCookie = new Cookie(loginCookie, session.getId());
			lgCookie.setPath("/");
			lgCookie.setMaxAge(24*60*60);
			
			response.addCookie(lgCookie); //왜 난 개발자모드 application 에서 쿠키에 안보이지?
			
			
		}
		
	}
	
	
	
}
