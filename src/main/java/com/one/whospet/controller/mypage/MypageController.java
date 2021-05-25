package com.one.whospet.controller.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;
import com.one.whospet.service.mypage.face.MypageService;




@Controller
public class MypageController {
	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	//로그인 서비스 객체
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/mypage/main")
	public void main() {}
	
	//유저 정보
	@RequestMapping(value = "/mypage/user")
	public void userinfo(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("user");
		User uinfo = mypageService.getUserInfo(user);
		Userpic upic = (Userpic) mypageService.getUserpic(user);
		//모델값 전달
		model.addAttribute("uinfo", uinfo);
		model.addAttribute("upic", upic);
	}
	
	//유저 프로필 사진 등록 화면
	@RequestMapping(value = "/mypage/userpic", method=RequestMethod.GET)
	public void userpic() {}
	
	//유저 프로필 사진 등록 처리
	@RequestMapping(value = "/mypage/userpic", method=RequestMethod.POST)
	public String userpicProc(Userpic userpic, HttpSession session, @RequestParam("file") MultipartFile file) {
		
		logger.debug("file정보" + file.toString());
		User user = (User) session.getAttribute("user");
		
		mypageService.deletePic(user);
		
		mypageService.filesave(user, file);
		return "redirect: /mypage/info";
	}
	
	//처리 완료 창
	@RequestMapping(value = "/mypage/info")
	public void done() {}
	
	
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
