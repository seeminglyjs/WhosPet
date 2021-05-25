package com.one.whospet.service.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.mypage.face.MypageDao;
import com.one.whospet.dto.User;
import com.one.whospet.service.mypage.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDao mypageDao;
	@Override
	public User getUserInfo(User user) {
		return mypageDao.selectUserinfo(user);
	}

}
