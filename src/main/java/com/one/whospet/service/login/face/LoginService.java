package com.one.whospet.service.login.face;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.one.whospet.dto.User;

public interface LoginService {

	/**
	 *로그인한 유저 정보를 찾는 메소드 
	 * 
	 * @param map  -> id 와 pw 가 들어 있다.
	 * @return
	 */
	public User findUser(HashMap<String, String> map);

	
	/**
	 * 카카오 메일로 접속한 유저가 기존에 가입한 유저인지 체크하는 메소드
	 * 
	 * @param kakaoEmail
	 * @return
	 */
	public User findUserByEmail(String kakaoEmail);


	/**
	 * 아이디 찾는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public User findId(HttpServletRequest request);

}
