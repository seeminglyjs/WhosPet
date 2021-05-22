package com.one.whospet.controller.join;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.whospet.controller.login.LoginController;

@Controller
public class JoinContoller {

	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	//회원 가입 화면 이동 메소드
	@RequestMapping(value = "/join/join")
	public void join() {
		logger.info("/join/join");
	}


}
