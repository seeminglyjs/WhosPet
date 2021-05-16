package com.one.whospet.service.login.face;

import java.util.HashMap;

import com.one.whospet.dto.User;

public interface LoginService {

	/**
	 *로그인한 유저 정보를 찾는 메소드 
	 * 
	 * @param map  -> id 와 pw 가 들어 있다.
	 * @return
	 */
	public User findUser(HashMap<String, String> map);

}
