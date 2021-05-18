package com.one.whospet.service.login.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.login.face.LoginDao;
import com.one.whospet.dto.User;
import com.one.whospet.service.login.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	
	@Autowired
	private LoginDao loginDao;
	
	@Override // 로그인한 유저 정보를 찾는 메소드
	public User findUser(HashMap<String, String> map) {

		User user = new User();
		
		//로그인 유정 정보를 찾는 쿼리 메소드
		user = loginDao.selectByLoginUser(map);
				
		return user;
	}
}
