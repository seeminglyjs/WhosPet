package com.one.whospet.controller.mypage;

import java.util.HashMap;
import java.util.List;

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

import com.one.whospet.dto.Board;
import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;
import com.one.whospet.service.mypage.face.MypageService;
import com.one.whospet.util.MypageBoardPaging;





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
	
	//회원 정보 수정전 확인 창
	@RequestMapping(value = "/mypage/updateCk", method=RequestMethod.GET)
	public void updateCk(HttpSession session, Model model) {
		
	}
	//회원 정보 수정 창
	@RequestMapping(value = "/mypage/update", method=RequestMethod.GET)
	public void update(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		User uinfo = mypageService.getUserInfo(user);
		//모델값 전달
		model.addAttribute("uinfo", uinfo);
	}
	
	//회원 정보 수정 처리
	@RequestMapping(value = "/mypage/update", method=RequestMethod.POST)
	public String updateProc(User upuser) {
		mypageService.update(upuser);
		return "redirect: /mypage/info";
	}
	
	//회원 탈퇴 페이지
	@RequestMapping(value = "/mypage/userout", method=RequestMethod.GET)
	public void deleteUser(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		User uinfo = mypageService.getUserInfo(user);
		//모델값 전달
		model.addAttribute("uinfo", uinfo);
	}
	
	//회원 탈퇴 처리
	@RequestMapping(value = "/mypage/userout", method=RequestMethod.POST)
	public String deleteUserProc(User outuser, HttpSession session) {
		mypageService.out(outuser, session);
		return "/mypage/info";
	}
	
	//게시판 목록 가져오기
	@RequestMapping(value = "/mypage/board")
	public void boardinfo(@RequestParam MypageBoardPaging inData, HttpSession session, Model model) {
		HashMap<String, Object> data = new HashMap();
		
		//유저 번호와 현재 페이지 가져오기
		User user = (User) session.getAttribute("user");
		int uNo = user.getuNo();
		int curPage = inData.getCurPage();
		
		//해쉬맵에 집어넣기
		data.put("uNo", uNo);
		data.put("curPage", curPage);
		
		//페이징 계산
		MypageBoardPaging paging = mypageService.getPaging(data);
		
		//페이징 객체 집어넣기
		data.put("paging", paging);
		
		//유저번호에 따른 게시글 가져오기
		List<Board> ublist = mypageService.getBoardByUser(data);
		
		//모델값 전달
		model.addAttribute("ublist", ublist);
	}
	
	@RequestMapping(value = "/mypage/booking")
	public void bookinginfo() {}
	
	@RequestMapping(value = "/mypage/point")
	public void pointinfo() {}
	
	@RequestMapping(value = "/mypage/pay")
	public void payinfo() {}
	
	@RequestMapping(value = "/mypage/basket")
	public void basketinfo() {}
}
