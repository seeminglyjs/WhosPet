package com.one.whospet.dao.login.face;

import java.util.HashMap;

import com.one.whospet.dto.User;

public interface LoginDao {

	/**
	 * 로그인한 유저 정보를 찾는 쿼리 메소드
	 * 
	 * @param map
	 * @return
	 */
	public User selectByLoginUser(HashMap<String, String> map);

}
