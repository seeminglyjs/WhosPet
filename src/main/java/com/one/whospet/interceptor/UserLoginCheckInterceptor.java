package com.one.whospet.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.one.whospet.dto.User;


public class UserLoginCheckInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(UserLoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("-----일반 유저 로그인 여부 체크-----");

		//세션검사 - 로그인일반유저일 경우에만 컨트롤러로 보내기

		//세션 객체
		HttpSession session = request.getSession();
		// 로그인 자체를 하지 않은 유저
		if(session.getAttribute("login") == null) {
			logger.info("접속불가 : 비 로그인 상태");

			//세션 만료시킴
			session.invalidate();
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인을 진행해주세요!'); location.href='/login/login' </script>");
			
//			//에러안내 페이지로 리다이렉트
//			response.sendRedirect("/");

			return false;// 컨트롤러 접근 금지
		}else {
			logger.info("--- 일반 유저 로그인 상태 ---");
			return true; // 컨트롤러로 요청정보를 보내줌( 요청 허가)
			
//			// 유저 객체를 가지고 온다.
//			User user = (User)session.getAttribute("user");
//
//			// 관리자 계정인 경우 -> 관리자 메인이로 보내준다.
//			if(user.getuGrade().equals("M")) {
//				response.sendRedirect("/home/adminMain");
//				return false;
//			}else { // 관리자 외에는 일반 유저
//				logger.info("--- 일반 유저 로그인 상태 ---");
//				return true; // 컨트롤러로 요청정보를 보내줌( 요청 허가)
//			}	
		}

	}
}
