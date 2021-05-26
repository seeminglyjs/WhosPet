package com.one.whospet.dao.mypage.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Board;
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

	/**
	 * 유저 정보 업데이트
	 * @param upuser
	 */
	public void updateUser(User upuser);

	/**
	 * 아이디와 패스워드가 일치하는 회원 찾기
	 * @param outuser
	 * @return
	 */
	public int selectUserCnt(User outuser);

	/**
	 * 회원삭제
	 * @param outuser
	 */
	public void deleteUser(User outuser);

	/**
	 * 글 목록 가져오기
	 * @param data 
	 * @return
	 */
	public List<Board> selectAllBoard(HashMap<String, Object> data);

	/**
	 * 총 게시글 조회
	 * @return
	 */
	public int selectCntAll();





}
