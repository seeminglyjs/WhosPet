package com.one.whospet.dao.join.face;

import com.one.whospet.dto.User;

public interface JoinDao {

	/**
	 * 휴대전화 기존 유저와의 중복여부 체크
	 * 
	 * @param phone
	 * @return
	 */
	public int selectCountPhone(String phone);

	
	/**
	 * 아이디 기존 유저와의 중복여부 체크
	 * 
	 * @param id
	 * @return
	 */
	public int selectCountId(String id);


	/**
	 * 이메일 기존 유저와의 중복여부 체크
	 * 
	 * @param email
	 * @return
	 */
	public int selectCountEmail(String email);


	/**
	 * 닉네임 기존 유저와의 중복여부 체크
	 * 
	 * @param nick
	 * @return
	 */
	public int selectCountNick(String nick);


	/**
	 * 유저 회원 가입 진행
	 * 
	 * @param user
	 */
	public void insertUser(User user);


	/**
	 * 회원 가입 유저 아이디 체크
	 * 
	 * @param getuId
	 * @return
	 */
	public int selectJoinId(String getuId);

}
