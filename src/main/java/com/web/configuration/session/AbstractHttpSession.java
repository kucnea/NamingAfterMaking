package com.web.configuration.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public abstract class AbstractHttpSession<T> {
	
	protected abstract String name();
	
//	세션에 값 저장
	public void setAttribute(T value) {
		getSession().setAttribute(name(), value);
	}
	
	protected HttpSession getSession() {
		return getRequest().getSession();
	}
	
	protected HttpServletRequest getRequest() {
		RequestAttributes requestAttributes =
				RequestContextHolder.getRequestAttributes();
		if(requestAttributes != null) {
			return ((ServletRequestAttributes) requestAttributes).getRequest();
		}
		return null;
	}
	
//	세션의 값 가져오기
	@SuppressWarnings("unchecked")
	public T getAttribute() {
		return (T) getSession().getAttribute(name());
	}
	
//	세션에 저젱된 정보 삭제
	public void removeAttribute() {
		getSession().removeAttribute(name());
	}
	
//	서센에 저장된 모든 정보 삭제 및 초기화
	public void invalidate() {
		getSession().invalidate();
	}
}
