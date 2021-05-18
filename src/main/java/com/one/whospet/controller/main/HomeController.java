package com.one.whospet.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	// 유저 메인화면으로 보내는 컨트롤러
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainView() {
		return "home/main";
	}
	
	// 관리자 메인화면으로 보내는 컨트롤러
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String mainAdminView() {
		return "home/adminMain";
	}
	
	// 테스트 컨트롤러
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String view() {
		return "mypage/mypagemain";
	}
	
}
