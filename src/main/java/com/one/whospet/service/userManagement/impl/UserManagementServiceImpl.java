package com.one.whospet.service.userManagement.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.userManagement.face.UserManagementDao;
import com.one.whospet.dto.User;
import com.one.whospet.service.userManagement.face.UserManagementService;
import com.one.whospet.util.BoardPaging;

@Service
public class UserManagementServiceImpl implements UserManagementService{

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(UserManagementServiceImpl.class);

	//관리자 유저 관리 DAO
	@Autowired
	UserManagementDao userMD;

	@Override
	public BoardPaging getPaging(HttpServletRequest request) {

		String param = request.getParameter("curPage");
		int curPage = 0;
		int totalCount = 0;

		// 파라미터 정보가 있는지 없는지 체크
		if(param != null && !param.equals("")) {
			curPage = Integer.parseInt(param);
		};

		//검색했는지 여부 체크
		String search = request.getParameter("search");
		if(search != null && !search.equals("")) {
			String searchCategory = request.getParameter("searchCategory");

			//카테고리가 없으면 기본 아이디로 설정
			if(searchCategory == null || !searchCategory.equals("u_id")
					&& !searchCategory.equals("u_nick") && !searchCategory.equals("u_name")) {
				searchCategory = "u_id";
			}

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			map.put("searchCategory", searchCategory);
			
			//검색한 내용 기준으로 총 게시글 수 체크
			totalCount = userMD.selectSearchCntUser(map);

		}else {//검색안했음 카테고리만 체크해서 넘김

			//검색 안했을 때 전체 유저 수 체크
			totalCount = userMD.selectCntUser();
		}

		BoardPaging paging = new BoardPaging(totalCount, curPage);

		return paging;
	}


	@Override // 유저의 전체 리스트를 가져오는 메소드
	public List<HashMap<String, Object>> getList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>> ();

		list = userMD.selectAll(map);

		return list;
	}
	
	@Override // 유저 상세 조회 정보를 가져오는 메소드
	public User detailUser(int uNo) {
		
		User user = new User();
		
		user = userMD.selectUserByUno(uNo);
		
		return user;
	}
}
