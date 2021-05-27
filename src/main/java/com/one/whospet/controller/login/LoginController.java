package com.one.whospet.controller.login;

import java.util.HashMap;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	//메일 보내는 객체
	@Autowired 
	private JavaMailSenderImpl mailSender;

	
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



	// 카카오톡으로 로그인 하는 메소드
	@RequestMapping(value = "/login/kakaoLogin")
	public void kakaoLogin() {
	}

	// 카카오톡으로 로그인 정보를 받아오는 메소드
	@RequestMapping(value = "/login/kakaoLogin", method = RequestMethod.POST)
	public String kakaoLoginRes(HttpServletRequest request, Model model, HttpSession session  ) {

		//이메일 정보를 받아온다.
		String kakaoEmail = request.getParameter("kakaoEmail");

		//받아온 이메일 정보를 출력한다
		logger.info(kakaoEmail);

		//해당 이메일가지고 있는 유저가 있는지 체크
		User user = loginService.findUserByEmail(kakaoEmail);

		// 유저인지 관리자 인지 체크

		if(user == null) {
			session.invalidate(); // 세션 만료시켜버림
			model.addAttribute("kakaoEmail", kakaoEmail); // 카카오 이메일 정보를 모델로 넘겨준다.
			return "/join/join"; // 비회원이기 때문에 회원가입 페이지 보내기
		}else {
			//로그인 한 정보가 있음 로그인(true)
			//로그인 유저 객체 전달(유저번호/아이디/유저등급/닉네임만 전달)
			session.setAttribute("login", true);
			session.setAttribute("user", user);
			return "/home/main"; // 기존 가입 유저 메인으로 보내기
		}


	}

	// 로그아웃 하는 메소드
	@RequestMapping(value = "/login/logout")
	public String login(HttpSession session, Model model) {
		session.invalidate(); // 현재 세션을 만료시킴
		return "redirect:/"; //메인으로 보내버림
	}

	//아이디 찾는 뷰 메소드
	@RequestMapping(value = "/login/searchId")
	public void searchId() {}

	//아이디 찾는 구현 메소드
	@RequestMapping(value = "/login/searchId", method = RequestMethod.POST)
	public String searchIdRes(HttpServletRequest request, Model model) {

		User user = loginService.findId(request);

		model.addAttribute("user", user);

		return "/login/searchIdResult";
	}


	//비밀번호 찾는 뷰 메소드
	@RequestMapping(value = "/login/searchPw")
	public void searchPw() {}

	//비밀번호 찾는 구현 메소드
	@RequestMapping(value = "/login/searchPw", method = RequestMethod.POST)
	public String searchPwRes(HttpServletRequest request, HttpSession session, Model model) {
		
		//기존 생성 랜덤 문자 4자리 값 가져오기
		String ranText = (String) session.getAttribute("ranText");
		logger.info(ranText);
		
		//유저가 입력해서 보낸 랜덤 번호값
		String sendText = request.getParameter("sendText");
		logger.info(sendText);
		if(sendText == null || !ranText.equals(sendText)) {
			session.invalidate();
			return "/login/searchPwResult";
		}else {
			logger.info("메인인증번호 맞음");
			//인증 번호가 맞음 아이디 이메일 같은지 여부 체크
			User user = loginService.searchPw(request);
			
			model.addAttribute("user", user);
			
			return "/login/searchPwResult";
		}
		
		
	}

	
	
	//메일 보내는 메소드[보내는 사람이 Gmail 계정이 있어야지만 가능]
	@RequestMapping(value = "/login/mailSend", method = RequestMethod.POST)
	public void mailSend(HttpServletRequest request, HttpSession session) {
		
		// 받는 사람 이메일 변수화
		final String email = (String)request.getParameter("email");
		
		//받는 사람 이메일 확인
		logger.info("메일 전송 {}", email);	
		
		//uuid 값 가져온다. 4자리 문자 (숫자 /영어)
		final String ranText = UUID.randomUUID().toString().split("-")[1];
		
		//세션에 번호 저장
		session.setAttribute("ranText", ranText);
		
		// 메일 전송 객체 생성 
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				
				helper.setFrom("WhosPet <>"); // 보내는 사람 <> 이메일 주소
				helper.setTo(email);  // 받는 사람	
				helper.setSubject("비밀번호 확인용 인증번호"); // 제목 
				helper.setText(
						"<h3>회원님의 인증번호</h3>"
						+ "<p>" + ranText + "</p>"
						, true); //내용
			} 
			
		}; 
		mailSender.send(preparator); //메일을 보낸다.
	}
}
