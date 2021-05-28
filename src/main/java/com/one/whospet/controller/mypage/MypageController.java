package com.one.whospet.controller.mypage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.Booking;
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
	//메일 보내는 객체
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	@InitBinder     
	public void initBinder(WebDataBinder binder){
	     binder.registerCustomEditor(       Date.class,     
	                         new CustomDateEditor(new SimpleDateFormat("dd/MM/yyyy"), true, 10));   
	}
	
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
	public void boardinfo(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		
		//해쉬맵 생성
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		logger.info("페이징 객체 가져오는지 확인해보기~~~!!! : {}", curPage);
		//유저 번호 가져오기
		User user = (User) session.getAttribute("user");
		int uNo = user.getuNo();
//		int curPage = curpage.getCurPage();
		
		//해쉬맵에 집어넣기
		data.put("uNo", uNo);
		data.put("curPage", curPage);
		
		//페이징 계산
		MypageBoardPaging paging = mypageService.getPaging(data);
		
		//페이징 객체 집어넣기
		data.put("paging", paging);
		logger.info("data 객체 가져오는지 확인해보기~~~!!! : {}", data);
		//유저번호에 따른 게시글 가져오기 서비스호출
		List<Board> ublist = mypageService.getBoardByUser(data);
		for( int i=0; i<ublist.size(); i++) {
			logger.info("게시글 목록" + ublist.get(i).toString());
			}
		//모델값 전달
		model.addAttribute("ublist", ublist);
		model.addAttribute("paging", paging);
	}
	
	//예약정보 가져오기
	@RequestMapping(value = "/mypage/booking")
	public void bookinginfo(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		
		//해쉬맵 생성
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		//유저 번호 가져오기
		User user = (User) session.getAttribute("user");
		int uNo = user.getuNo();
		
		//해쉬맵에 집어넣기
		data.put("uNo", uNo);
		data.put("curPage", curPage);
		
		//페이징 계산
		MypageBoardPaging paging = mypageService.getPaging(data);
		
		//페이징 객체 집어넣기
		data.put("paging", paging);
		
		logger.info("data 객체 가져오는지 확인해보기~~~!!! : {}", data);
		//유저번호에 따른 게시글 가져오기 서비스호출
		List<Booking> booklist = mypageService.getBookingByUser(data);
		for( int i=0; i<booklist.size(); i++) {
			logger.info("게시글 목록" + booklist.get(i).toString());
			}
		
		//모델값 전달
		model.addAttribute("booklist", booklist);
		model.addAttribute("paging", paging);
	}
	
	//예약정보 상세보기 가져오기
	@RequestMapping(value = "/mypage/bookingDetail", method=RequestMethod.GET)
	public void bookingdetail(int bookno, Model model) {
		Booking view = mypageService.view(bookno);
		//model에 첨부파일 속성값 설정
		model.addAttribute("view", view);
		
	}
	
	//예약 취소 처리
	@RequestMapping(value = "/mypage/bookingDetail", method=RequestMethod.POST)
	public String bookingcancel(Booking booking, HttpSession session) {
		//유저아이디와 예약정보 가져오고 저장
		User user = (User) session.getAttribute("user");
		final String uId = user.getuId();
		final int bookno = booking.getBookNo();
		
		logger.info("booking객체 확인" + booking.toString());
		mypageService.bookingCancel(booking);
		
		

		
		// 메일 전송 객체 생성 
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
		@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
		final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						
						
			helper.setFrom("WhosPet <kul32137@gmail.com>"); // 보내는 사람 <> 이메일 주소
			helper.setTo("kul321japan@gmail.com");  // 받는 사람	
			helper.setSubject( uId + "님의 예약이 취소되었습니다"); // 제목 
			helper.setText("예약번호"+bookno+"번의 예약이 취소되었습니다", true); //내용
					} 
					
				}; 
				mailSender.send(preparator); //메일을 보낸다.
		
		//마이페이지 메인으로 리다이렉트
		return "redirect:/mypage/user";
		
		
	}
	
	@RequestMapping(value = "/mypage/point")
	public void pointinfo() {}
	
	@RequestMapping(value = "/mypage/pay")
	public void payinfo() {}
	
	@RequestMapping(value = "/mypage/basket")
	public void basketinfo() {}
}
