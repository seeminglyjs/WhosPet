package com.one.whospet.controller.join;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.whospet.controller.login.LoginController;
import com.one.whospet.dto.User;
import com.one.whospet.service.join.face.JoinService;

@Controller
public class JoinContoller {

	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private JoinService joinService;

	//회원 가입 화면 이동 메소드
	@RequestMapping(value = "/join/join")
	public void join() {
		logger.info("/join/join");
	}

	//가입 아이디의 존재(중복) 여부를 체크하는 컨트롤러
	@RequestMapping(value = "/join/overlap/id", method=RequestMethod.POST)
	public void overlapId(HttpServletRequest request, Model model) {
		
		
		String id =(String) request.getParameter("id");	
		logger.info(id);

		int check = joinService.overlapId(id);

		model.addAttribute("idCheck", check);
	}


	//가입 전화번호의 존재(중복) 여부를 체크하는 컨트롤러
	@RequestMapping(value = "/join/overlap/phone", method=RequestMethod.POST)
	public void overlapPhone(HttpServletRequest request, Model model) {
		String phone =(String) request.getParameter("phone");	
		logger.info(phone);

		int check = joinService.overlapPhone(phone);

		model.addAttribute("phoneCheck", check);
	}

	//가입 이메일의 존재(중복) 여부를 체크하는 컨트롤러
	@RequestMapping(value = "/join/overlap/email", method=RequestMethod.POST)
	public void overlapEmail(HttpServletRequest request, Model model) {
		String email =(String) request.getParameter("email");	
		logger.info(email);

		int check = joinService.overlapEmail(email);

		model.addAttribute("emailCheck", check);
	}

	//가입 닉네임의 존재(중복) 여부를 체크하는 컨트롤러
	@RequestMapping(value = "/join/overlap/nick", method=RequestMethod.POST)
	public void overlapNick(HttpServletRequest request, Model model) {
		String nick =(String) request.getParameter("nick");	
		logger.info(nick);

		int check = joinService.overlapNick(nick);

		model.addAttribute("nickCheck", check);
	}



	//회원 가입 화면 진행 메소드
	@RequestMapping(value = "/join/join", method = RequestMethod.POST)
	public String joinUser(HttpServletRequest request, Model model) {
		logger.info("/join/join");

		User user = new User();

		int check = 0;
		
		// 가입이 완료되면 1을 리턴
		check = joinService.joinUser(request);
		
		if(check == 0) {
			return "redirect:/join/join";
		}else {
			return "redirect:/";
		}
	}

}
