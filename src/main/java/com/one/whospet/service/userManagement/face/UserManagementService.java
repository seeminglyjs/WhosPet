package com.one.whospet.service.userManagement.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.one.whospet.dto.User;
import com.one.whospet.util.BoardPaging;

public interface UserManagementService {

	// 페이징을 얻어 오는 메소드
	public BoardPaging getPaging(HttpServletRequest request);

	// 유저 리스트를 얻어오는 메소드
	public List<HashMap<String, Object>> getList(HashMap<String, Object> map);

	// 유저 상세 정보를 가져 오는 메소드
	public User detailUser(int uNo);

	// 유저를 삭제하는 메소드
	public void deleteUser(int uNo);

}
