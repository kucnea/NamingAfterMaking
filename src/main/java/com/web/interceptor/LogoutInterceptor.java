package com.web.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LogoutInterceptor extends HandlerInterceptorAdapter implements SessionNames {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		System.out.println("logout preHandle");
		
//		if(session.getAttribute(login)!=null) session.removeAttribute(login);
		if(session.getAttribute(login)!=null) session.invalidate();
		
		//로그인 검증 쿠키로 했을때, 로그아웃시 쿠키 삭제하던 코드
//		Cookie lgCookie = WebUtils.getCookie(request, SessionNames.loginCookie);
//		if(lgCookie != null) {
//			lgCookie.setPath("/");
//			lgCookie.setMaxAge(0);
//			response.addCookie(lgCookie);
//		}
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView mv) throws Exception {

		HttpSession session = request.getSession();
		System.out.println("logout post Handle");
		
		mv.getModelMap().remove("player");
		
	}
	
	
	
}
