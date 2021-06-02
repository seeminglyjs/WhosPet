package com.one.whospet.dao.userManagement.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.User;

public interface UserManagementDao {

	/**
	 * 전체 유저를 카운트 하는 메소드
	 * 
	 * @return
	 */
	public int selectCntUser();

	/**
	 * 전체 유저를 가지고 오는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> selectAll(HashMap<String, Object> map);

	/**
	 * 검색에 따른 유저 수를 카운트 하는 메소드
	 * 
	 * @param map
	 * @return
	 */
	public int selectSearchCntUser(HashMap<String, Object> map);

	/**
	 * 유저의 상세 정보를 가져오는 메소드
	 * 
	 * @param uNo
	 * @return
	 */
	public User selectUserByUno(int uNo);

}
