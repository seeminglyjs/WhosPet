package com.one.whospet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UnLoginCheckInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(UnLoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("-----로그인 유저 접근 체크-----");

		//세션검사 - 비로그인 상태일 경우에만 컨트롤러로 보내기
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		//세션 객체
		HttpSession session = request.getSession();
		// 로그인 자체를 하지 않은 유저
		if(session.getAttribute("login") != null) {
			logger.info("접속불가 : 로그인 상태");

			//세션 만료시킴
			session.invalidate();

			//에러안내 페이지로 리다이렉트
			response.sendRedirect("/");

			return false;// 컨트롤러 접근 금지
		}else {
			return true; // 컨트롤러로 요청정보를 보내줌( 요청 허가)
		}	
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
}
