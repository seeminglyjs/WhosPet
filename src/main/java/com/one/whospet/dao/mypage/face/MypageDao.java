package com.one.whospet.dao.mypage.face;

import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;

public interface MypageDao {
	/**
	 * user객체 안 userno에 따른 유저정보 가져오기
	 * @param user
	 * @return
	 */
	public User selectUserinfo(User user);

	/**
	 * 파일삽입
	 * @param userpic
	 */
	public void insertFile(Userpic userpic);
	
	/**
	 * 유저번호에 따른 사진 파일 찾아오기
	 * @param user
	 * @param userpic
	 * @return 
	 */
	public Userpic selectPicByUNo(User user);
	/**
	 * 유저번호에 따른 사진 파일 제거
	 * @param user
	 * @param userpic
	 */
	public void deleteUserPic(User user);





}
