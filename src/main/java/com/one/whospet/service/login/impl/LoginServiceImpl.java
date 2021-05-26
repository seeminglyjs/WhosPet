package com.one.whospet.service.login.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
	
	
	@Override // 카카오 로그인 유저가 기존 가입 유저인지 체크하는 메소드
	public User findUserByEmail(String kakaoEmail) {
		
		User user = new User();
		
		//이메일 정보를 기준으로 해당 유저가 기존 가입 유저 인지 체크
		user = loginDao.selectByEmail(kakaoEmail);
		return user;
	}
	
	@Override // 아이디 찾는 메소드
	public User findId(HttpServletRequest request) {
		
		User user = new User();
		user.setuName(request.getParameter("name"));
		user.setuPhone(request.getParameter("phone"));
		
		user = loginDao.selectSearchId(user);
		
		return user;
	}
}
