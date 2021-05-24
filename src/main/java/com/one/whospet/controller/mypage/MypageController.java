package com.one.whospet.controller.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.whospet.dto.User;
import com.one.whospet.service.mypage.face.MypageService;




@Controller
public class MypageController {
	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	//로그인 서비스 객체
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/mypage/mypagemain")
	public void main() {}
	
	@RequestMapping(value = "/mypage/user")
	public void userinfo() {}
	
	@RequestMapping(value = "/mypage/board")
	public void boardinfo() {}
	
	@RequestMapping(value = "/mypage/booking")
	public void bookinginfo() {}
	
	@RequestMapping(value = "/mypage/point")
	public void pointinfo() {}
	
	@RequestMapping(value = "/mypage/pay")
	public void payinfo() {}
	
	@RequestMapping(value = "/mypage/basket")
	public void basketinfo() {}
}
