package com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FrontInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("gift", "gift");
		System.out.println("preHandle has : "+session.getAttribute("pId"));
		
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		System.out.println("afterHandle has : "+session.getAttribute("gift"));
		System.out.println("afterHandle has : "+modelAndView.getModel().get("pId"));
		
		
	}
	
	
	
}
