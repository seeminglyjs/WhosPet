package com.one.whospet.service.mypage.face;

import com.one.whospet.dto.User;

public interface MypageService {
	/**
	 * 유저번호를 받아 유저정보 가져오기
	 * @param user
	 * @return
	 */
	User getUserInfo(User user);

}
