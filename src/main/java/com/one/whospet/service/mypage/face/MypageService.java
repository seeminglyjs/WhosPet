package com.one.whospet.service.mypage.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;

public interface MypageService {
	/**
	 * 유저번호를 받아 유저정보 가져오기
	 * @param user
	 * @return
	 */
	public User getUserInfo(User user);

	/**
	 * 유저객체의 유저번호를 받고 파일을 저장
	 * @param user
	 * @param file
	 */
	public void filesave(User user, MultipartFile file);

	/**
	 * 기존 사진파일 제거
	 * @param user
	 */
	public void deletePic(User user);

	/**
	 * 유저정보에 따른 유저사진 가져오기
	 * @param user
	 * @return
	 */
	public Userpic getUserpic(User user);

	/**
	 * 유저 정보 업데이트
	 * @param upuser
	 */
	public void update(User upuser);

	/**
	 * 유저 탈퇴 처리
	 * @param outuser
	 * @param session 
	 */
	public String out(User outuser, HttpSession session);

}
