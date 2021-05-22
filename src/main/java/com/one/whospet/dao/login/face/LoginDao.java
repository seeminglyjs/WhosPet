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

	/**
	 * 카카오 로그인 유저의 이메일 정보를 입력받아 기존에 가입한 유저인지 찾는 쿼리문
	 *
	 * 
	 * @param kakaoEmail -> 카카오 로그인 이메일
	 * @return
	 */
	public User selectByEmail(String kakaoEmail);

}
