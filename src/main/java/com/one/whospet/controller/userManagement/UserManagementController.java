package com.one.whospet.controller.userManagement;

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

import com.one.whospet.dto.User;
import com.one.whospet.service.userManagement.face.UserManagementService;
import com.one.whospet.util.BoardPaging;

@Controller
@RequestMapping(value = "/admin") // 관리자 페이지 공통
public class UserManagementController {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(UserManagementController.class);


	@Autowired
	UserManagementService userMS;

	// 유저 게시판 리스트 뷰 컨트롤러
	@RequestMapping(value = "/user/list")
	public void list(HttpServletRequest request, Model model) {

		// 페이징을 얻어온다.
		BoardPaging paging = userMS.getPaging(request);

		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("paging", paging);	

		// 검색 여부 체크
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
			String searchCategory = request.getParameter("searchCategory");

			//카테고리가 없으면 기본 아이디로 설정
			if(searchCategory == null || !searchCategory.equals("u_id")
					&& !searchCategory.equals("u_nick") && !searchCategory.equals("u_name")) {
				searchCategory = "u_id";
			}

			map.put("search", search);
			map.put("searchCategory", searchCategory);	
		}

		// 페이지의 해당 하는 게시글 목록을 얻어온다.
		list = userMS.getList(map);

		//페이징/ 게시글과 게시글갯수를 넘긴다.
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);		
		model.addAttribute("listSize", list.size());
	}


	// 유저 정보 상세 조회 컨트롤러
	@RequestMapping(value = "/user/detail")
	public String detail(HttpServletRequest request, Model model) {

		String param = request.getParameter("uNo");
		int uNo = -1;
		if(param != null && !param.equals("")) { // 파라미터 체크
			try { // 숫자가 아닌 문자열 이나 공백문자를 받을 경우 리스트로 보내버림
				uNo = Integer.parseInt(param);
			} catch (NumberFormatException e) {
				return "redirect:/admin/user/list";
			}	
		}
		//유저 정보를 가져오는 메소드
		User user = userMS.detailUser(uNo);

		//조회된 게시글 존재 여부 체크
		if(user == null) {
			return "redirect:/user/list";
		}	
		// 유저 정보 객체 전달
		model.addAttribute("user", user);
		return "/admin/user/detail";
	}	

	// 유저를 삭제하는 메소드
	@RequestMapping(value = "/user/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		String param = request.getParameter("uNo");

		//요청 파라미터가 null 이거나 빈문자열이면 돌려보냄
		if(param == null || param.equals("")) {
			return "redirect:/admin/user/list";
		}

		int uNo = 0;
		try { // 예외 발생시 리스트로 보내버림
			uNo = Integer.parseInt(param);
		} catch (Exception e) {
			return "redirect:/admin/user/list";
		}

		userMS.deleteUser(uNo);// 유저삭제
		return "redirect:/admin/user/list";
	}
	
	// 유저를 등록하는 화면을 보여주는 메소드 [get]
	@RequestMapping(value = "/user/enroll")
	public void enroll(HttpServletRequest request, Model model) {}
	
	// 유저를 등록하는 메소드 [post]
	@RequestMapping(value = "/user/enroll", method = RequestMethod.POST)
	public String enrollRes(HttpServletRequest request, Model model) {

		int check = 0;
		
		// 등록이 완료되면 1을 리턴
		check = userMS.enrollUser(request);
		
		if(check == 0) {
			return "redirect:/admin/user/list";
		}else {
			return "redirect:/admin/user/list";
		}
	}

}
