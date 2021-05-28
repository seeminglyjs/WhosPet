package com.one.whospet.service.join.impl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.join.face.JoinDao;
import com.one.whospet.dto.User;
import com.one.whospet.service.join.face.JoinService;

@Service
public class JoinServiceImpl implements JoinService {
	
	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(JoinServiceImpl.class);
	
	@Autowired
	private JoinDao joinDao;
	
	@Override //휴대전화 기존 유저와의 중복여부 체크
	public int overlapPhone(String phone) {
		
		// 중복 여부 체크 변수
		int check = 1;
		
		// 해당 번호 없으면 0 리턴
		check = joinDao.selectCountPhone(phone);
		
		return check;
	}
	
	@Override //아이디 기존 유저와의 중복여부 체크
	public int overlapId(String id) {
		
		// 중복 여부 체크 변수
		int check = 1;
		
		// 해당 번호 없으면 0 리턴
		check = joinDao.selectCountId(id);
		
		return check;
	}
	
	
	@Override //이메일 기존 유저와의 중복여부 체크
	public int overlapEmail(String email) {
		// 중복 여부 체크 변수
		int check = 1;
		
		// 해당 번호 없으면 0 리턴
		check = joinDao.selectCountEmail(email);
		
		return check;
	}
	
	@Override //닉네임 기존 유저와의 중복여부 체크
	public int overlapNick(String nick) {
		// 중복 여부 체크 변수
		int check = 1;
		
		// 해당 번호 없으면 0 리턴
		check = joinDao.selectCountNick(nick);
		
		return check;
	}
	
	
	@Override // 유저를 회원가입 시키는 메소드
	public int joinUser(HttpServletRequest request) {
		
		int check = 0;
		
		User user = new User();
		
		user.setuId(request.getParameter("id"));
		user.setuPw(request.getParameter("pw"));
		user.setuName(request.getParameter("name"));
		user.setuPhone(request.getParameter("phone"));
		user.setuEmail(request.getParameter("email"));
		user.setuNick(request.getParameter("nick"));
		user.setuPost(Integer.parseInt(request.getParameter("postcode")));
		user.setuAddress(request.getParameter("address"));
		user.setuDetailAddress(request.getParameter("detailAddress"));
		user.setuGrade(request.getParameter("ugrade"));
		user.setuPet(request.getParameter("pet"));
		
		// 유저 회원 가입 진행
		joinDao.insertUser(user);

		// 유저 회원 가입 여부 체크;
		check = joinDao.selectJoinId(user.getuId());
		
		return check;
	}
}
