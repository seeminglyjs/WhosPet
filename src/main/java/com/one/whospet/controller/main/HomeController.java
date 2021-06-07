package com.one.whospet.controller.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Review;
import com.one.whospet.service.main.face.MainService;
import com.one.whospet.service.treatment.face.TreatmentService;


@Controller
public class HomeController {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인 서비스 객체
	@Autowired
	MainService mainService;
	
	@Autowired
	TreatmentService treatmentService;
	
	// 유저 메인화면으로 보내는 컨트롤러
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainView(Model model) {
		
		List<Hospital> newHospitalList = new ArrayList<Hospital>();
		List<Hospital> bestHospitalList = new ArrayList<Hospital>();
		List<HashMap<String,Object>> bestReviewList = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		List<HashMap<String, Object>> newList = new ArrayList<HashMap<String, Object>>();
		List<String> as = new ArrayList<String>();

		for(HashMap<String,Object> m : treatmentList) {
			String a = (String)m.get("TR_NAME");
			if(!as.contains(a)) {
				as.add(a);
				newList.add(m);
			}
		}
			
		//최근 등록 병원 목록을 가져오는 메소드 10개
		newHospitalList = mainService.getNewList();
		
		//최다 조회 병원 목록을 가져오는 메소드 10 개
		bestHospitalList = mainService.getBestList();

		//베스트 리뷰 병원 목록을 가져오는 메소드 10 개
		bestReviewList = mainService.getBestReviewList();
			
		//신규등록 병원 10곳 전달
		model.addAttribute("newHospitalList", newHospitalList);
		
		//최다 조회 병원 10 곳 전달
		model.addAttribute("bestHospitalList", bestHospitalList);

		//베스트 리뷰 10곳 전달
		model.addAttribute("bestReviewList", bestReviewList);
		
		//치료 리스트 저장
		model.addAttribute("treatmentList", newList);
		
		return "/home/main";
	}

	
	// 메인 검색 컨트롤러
	@RequestMapping(value = "/mainSerch" )
	public String mainSearch(Model model,HttpServletRequest request) {
		String data = request.getParameter("data");
		
		if(data == null || data.equals("")) {
			return "redirect:/home/searchNone";
		}else {
			
			//치료번호 기본키를 가져온다.
			String no = mainService.getTreatNo(data);	
			
			//검색 결과 존재여부 체크
			if(no == null || no.equals("")) {
				return "redirect:/home/searchNone"; // 검색결과 없음
			}else {
				model.addAttribute("no", no);
				return "redirect:/treatment/treatdetail"; // 검색결과 있음
			}
		}
	}
	
	// 메인 검색 결과없는 페이지 리턴 컨트롤러
	@RequestMapping(value = "/home/searchNone" )
	public void searchNone() {}
	
	
	/////////////// 관리자 홈 컨트롤러  //////////////////////////////
	
	
	// 관리자 메인화면으로 보내는 컨트롤러
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String mainAdminView(Model model) {
		
		List<Hospital> newHospitalList = new ArrayList<Hospital>();
		List<Hospital> bestHospitalList = new ArrayList<Hospital>();
		List<HashMap<String,Object>> bestReviewList = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		List<HashMap<String, Object>> newList = new ArrayList<HashMap<String, Object>>();
		List<String> as = new ArrayList<String>();

		for(HashMap<String,Object> m : treatmentList) {
			String a = (String)m.get("TR_NAME");
			if(!as.contains(a)) {
				as.add(a);
				newList.add(m);
			}
		}
					
		//최근 등록 병원 목록을 가져오는 메소드 10개
		newHospitalList = mainService.getNewList();
		
		//최다 조회 병원 목록을 가져오는 메소드 10 개
		bestHospitalList = mainService.getBestList();

		//베스트 리뷰 병원 목록을 가져오는 메소드 10 개
		bestReviewList = mainService.getBestReviewList();
			
		//신규등록 병원 10곳 전달
		model.addAttribute("newHospitalList", newHospitalList);
		
		//최다 조회 병원 10 곳 전달
		model.addAttribute("bestHospitalList", bestHospitalList);

		//베스트 리뷰 10곳 전달
		model.addAttribute("bestReviewList", bestReviewList);
		
		//치료 리스트 저장
		model.addAttribute("treatmentList", newList);

		return "home/adminMain";
	}


}
