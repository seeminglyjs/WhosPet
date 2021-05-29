package com.one.whospet.service.mypage.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.Booking;
import com.one.whospet.dto.Point;
import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;
import com.one.whospet.util.MypageBoardPaging;

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



	/**
	 * 페이징 계산
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getPaging(HashMap<String, Object> data);
	
	/**
	/**
	 * 데이터 객체 속 유저번호로 게시글 목록 가져오기
	 * @param data
	 * @return
	 */
	public List<Board> getBoardByUser(HashMap<String, Object> data);

	 /**
	 * 데이터 객체 속 유저번호로 부킹 목록 가져오기
	 * @param data
	 * @return
	 */
	public List<Booking> getBookingByUser(HashMap<String, Object> data);

	/**
	 * 예약정보 상세보기
	 * @param bookno
	 * @return
	 */
	public Booking view(int bookno);

	/**
	 * 예약 취소하기
	 * @param booking
	 */
	public void bookingCancel(Booking booking);
	
	/**
	 * 데이터 객체 속 유저번호로 포인트 이력 가져오기
	 * @param data
	 * @return
	 */
	public List<Point> getPointByUser(HashMap<String, Object> data);

	/**
	 * 현재포인트(지금까지의 유저 총합포인트) 구하기
	 * @param uNo
	 * @return
	 */
	public Point getCurpointByUser(int uNo);

}
