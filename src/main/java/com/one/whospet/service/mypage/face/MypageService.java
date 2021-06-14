package com.one.whospet.service.mypage.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dto.Board;
import com.one.whospet.dto.Booking;
import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Order;
import com.one.whospet.dto.Payment;
import com.one.whospet.dto.Point;
import com.one.whospet.dto.ShopBasket;
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
	 * 게시판 페이징 계산
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getBoardPaging(HashMap<String, Object> data);
	
	/**
	 * 예약 페이징 계산
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getBookingPaging(HashMap<String, Object> data);

	
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
	
	/**포인트 이력 행수 구하기
	 * 
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getPointPaging(HashMap<String, Object> data);
	
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

	/**
	 * 현재페이지로 페이징
	 * @param curPage
	 * @return
	 */
	public MypageBoardPaging getPaging(int curPage);

	/**
	 * 병원 목록 조회
	 * @param paging
	 * @return
	 */
	public List<Hospital> hospitalList(MypageBoardPaging paging);

	/**
	 * 병원 총 개수 조회
	 * @param curPage
	 * @return
	 */
	public MypageBoardPaging getHospitalPaging(int curPage);

	/**
	 * 총 예약 페이징
	 * @param curPage
	 * @return
	 */
	public MypageBoardPaging getHosBookingaging(int curPage);

	/**
	 * 예약 목록 조회
	 * @param paging
	 * @return
	 */
	public List<Booking> bookingList(MypageBoardPaging paging);

	/**
	 * 선택된 병원 삭제 
	 * @param map
	 * @return
	 */
	public int deleteHospital(HashMap<String, Object> map);

	/**
	 * 예약 승인
	 * @param booking
	 */
	public void bookingApprove(Booking booking);

	/**
	 * 예약 거절
	 * @param booking
	 */
	public void bookingReject(Booking booking);

	/**
	 * 장바구니 페이징
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getBasketPaging(HashMap<String, Object> data);

	/**
	 * 장바구니 목록 조회
	 * @param data
	 * @return
	 */
	public List<ShopBasket> basketList(HashMap<String, Object> data);

	/**
	 * 장바구니 합계 계산
	 * @param data
	 * @return
	 */
	public Integer basketSum(HashMap<String, Object> data);

	/**
	 * 장바구니 아이템 삭제
	 * @param sbNo
	 * @return
	 */
	public int deleteBasket(int sbNo);

	/**
	 * 구매이력 페이징
	 * @param data
	 * @return
	 */
	public MypageBoardPaging getPayPaging(HashMap<String, Object> data);

	/**
	 * 구매이력 목록
	 * @param data
	 * @return
	 */
	public List<Payment> paymentList(HashMap<String, Object> data);

	/**
	 * 장바구니 아이템 추가
	 * @param sbNo
	 * @return
	 */
	public int plusItemBasket(int sbNo);

	/**
	 * 장바구니 아이템 감소
	 * @param sbNo
	 * @return
	 */
	public int minusItemBasket(int sbNo);

	/**
	 * 구매내역 목록을 위한 페이징 객체를 생성한다
	 * 
	 * @param inData - 현재페이지를 저장하고 있느 Paging객체
	 * @return 페이징 계산이 완료된 Paging 객체 
	 */
	public MypageBoardPaging getPayPaging(MypageBoardPaging inData);

	/**
	 * 유저번호에 맞는 
	 * 
	 * @param uNo 유저번호
	 * @return
	 */
//	public List<Order> selectOrder(MypageBoardPaging paging);
	public List<HashMap<String, Object>> selectOrder(MypageBoardPaging paging);





	
}
