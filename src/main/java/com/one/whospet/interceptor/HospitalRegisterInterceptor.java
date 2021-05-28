package com.one.whospet.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.one.whospet.dto.User;

public class HospitalRegisterInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		if( session.getAttribute("login")==null ) {
			out.println("<script>alert('로그인해주세요!'); location.href='/login/login' </script>");
			return false;
		}
		
		User user = (User)session.getAttribute("user");
		
		//병원관계자가 아닐경우
		if( !"H".equals(user.getuGrade()) ) {
			out.println("<script>alert('병원관계자만 등록할 수 있습니다'); location.href='/' </script>");
			return false;
		}
		
		
		return true;
	}
	
	
}
