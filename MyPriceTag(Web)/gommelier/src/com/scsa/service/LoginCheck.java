package com.scsa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if(session == null){
			response.sendRedirect("index.jsp");
			return false;
		}
		
		if(session.getAttribute("user") == null){
			response.sendRedirect("index.jsp");
			return false;
		}
		
		return true;
	}
	
}
