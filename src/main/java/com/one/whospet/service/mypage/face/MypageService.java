package com.one.whospet.service.mypage.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;

public interface MypageService {
	/**
	 * 유저번호를 받아 유저정보 가져오기
	 * @param user
	 * @return
	 */
	User getUserInfo(User user);

	/**
	 * 유저객체의 유저번호를 받고 파일을 저장
	 * @param user
	 * @param file
	 */
	void filesave(User user, MultipartFile file);

	/**
	 * 기존 사진파일 제거
	 * @param user
	 */
	void deletePic(User user);

	/**
	 * 유저정보에 따른 유저사진 가져오기
	 * @param user
	 * @return
	 */
	Userpic getUserpic(User user);

}
