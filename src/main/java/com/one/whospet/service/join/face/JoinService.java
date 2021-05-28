package com.one.whospet.service.join.face;

import javax.servlet.http.HttpServletRequest;

import com.one.whospet.dto.User;

public interface JoinService {

	/**
	 * 휴대전화 기존 유저와의 중복여부 체크
	 * 
	 * @param phone
	 * @return
	 */
	public int overlapPhone(String phone);

	
	/**
	 * 아이디 기존 유저와의 중복여부 체크
	 * 
	 * @param id
	 * @return
	 */
	public int overlapId(String id);


	/**
	 * 이메일 기존 유저와의 중복여부 체크
	 * 
	 * @param email
	 * @return
	 */
	public int overlapEmail(String email);


	/**
	 * 닉네임 기존 유저와의 중복여부 체크
	 * 
	 * @param nick
	 * @return
	 */
	public int overlapNick(String nick);

	/**
	 * 유저를 회원가입시키는 메소드
	 * 
	 * @param request
	 * @return
	 */
	public int joinUser(HttpServletRequest request);

}
