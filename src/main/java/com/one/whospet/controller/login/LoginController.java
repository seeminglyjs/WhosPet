package com.one.whospet.controller.login;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.whospet.dto.User;
import com.one.whospet.service.login.face.LoginService;

@Controller
public class LoginController {

	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	//로그인 서비스 객체
	@Autowired
	private LoginService loginService;

	// 로그인 화면으로 보내는 메소드
	@RequestMapping(value = "/login/login")
	public void login() {
	}

	//로그인 정보를 받아오는 메소드 [map 으로 id와 pw를 받아온다] 
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String loginRes(@RequestParam HashMap<String, String> map, HttpSession session, HttpServletResponse response, HttpServletRequest request,
			@CookieValue(value="idCookie", required = false) Cookie idCookie,
			@CookieValue(value="idCheckCookie", required = false) Cookie idCheck) {

		//로그인 전달 객체 확인
		logger.info(map.toString());

		//로그인한 유저 정보를 찾는 메소드
		User user = loginService.findUser(map);

		//유저 정보가 null이거나 조회된 결과가 없으면 다시 로그인 페이지로 보냄
		if(user == null || user.getuNo() == 0) {
			return "redirect:/login/login";
		}else {

			//로그인 한 정보가 있음 로그인(true)
			//로그인 유저 객체 전달(유저번호/아이디/유저등급/닉네임만 전달)
			session.setAttribute("login", true);
			session.setAttribute("user", user);

			//아이디 기억하기가 체크 되었을때 (다음 로그인 부터 기억된다)
			if(map.get("memoryId")!= null) {
				idCookie = new Cookie("idCookie", user.getuId());
				idCookie.setMaxAge(90*24*60*60); //90일동안 보관

				idCheck = new Cookie("idCheck", "checked");
				idCheck.setMaxAge(90*24*60*60); //90일동안 보관

				response.addCookie(idCookie); // 아이디 정보 저장
				response.addCookie(idCheck); // 체크 정보 저장


			}else { //기억하기 체크되지 않을시 쿠기를 만료 시킨다.
				Cookie[] cookies = request.getCookies();
				if(cookies != null) {
					for(Cookie c : cookies) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
		}	

		// 유저인지 관리자 인지 체크
		if(user.getuGrade().equals("M")) {
			return "/home/adminMain"; // 관리자 메인으로 보내기
		}else {
			return "/home/main"; // 유저 메인으로 보내기
		}
	}


	// 로그아웃 하는 메소드
	@RequestMapping(value = "/login/logout")
	public String login(HttpSession session) {
		session.invalidate(); // 현재 세션을 만료시킴
		return "redirect:/"; //메인으로 보내버림
	}



}
