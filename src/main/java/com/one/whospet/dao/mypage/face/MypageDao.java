package com.one.whospet.dao.mypage.face;

import com.one.whospet.dto.User;

public interface MypageDao {
	/**
	 * user객체 안 userno에 따른 유저정보 가져오기
	 * @param user
	 * @return
	 */
	public User selectUserinfo(User user);

}
