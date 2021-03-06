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

	/**
	 * 유저 정보를 삭제하는 메소드
	 * 
	 * @param uNo
	 */
	public void deleteUser(int uNo);

	/**
	 * 유저를 등록하는 메소드
	 * 
	 * @param user
	 */
	public void insertUser(User user);

	/**
	 * 등록된 유저를 체크하는 메소드
	 * 
	 * @param getuId
	 * @return
	 */
	public int selectEnrollId(String getuId);

}
