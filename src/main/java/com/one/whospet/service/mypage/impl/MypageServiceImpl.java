package com.one.whospet.service.mypage.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dao.mypage.face.MypageDao;
import com.one.whospet.dto.Board;
import com.one.whospet.dto.Booking;
import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Point;
import com.one.whospet.dto.ShopBasket;
import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;
import com.one.whospet.service.mypage.face.MypageService;
import com.one.whospet.util.MypageBoardPaging;



@Service
public class MypageServiceImpl implements MypageService {

	//로거 객체
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	@Autowired
	private MypageDao mypageDao;
	@Autowired ServletContext context;
	@Override
	public User getUserInfo(User user) {
		return mypageDao.selectUserinfo(user);
	}
	@Override
	public void filesave(User user, MultipartFile file) {
		int uNo = user.getuNo();
		if( file.getSize() <= 0 ) {
			return;
		}
		
		String storedPath = context.getRealPath("upload");
		
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		String filename = file.getOriginalFilename();
		
		String uid = UUID.randomUUID().toString().split("-")[4];
		
		filename += uid;
		
		File dest = new File( stored, filename );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Userpic userpic = new Userpic();
		userpic.setUpicOriname(file.getOriginalFilename());
		userpic.setUpicStoname( filename );
		userpic.setuNo(uNo);
		
		mypageDao.insertFile( userpic );
	}
	@Override
	public void deletePic(User user) {
		
//		Userpic picresult = mypageDao.selectPicByUNo(user);
		
		//기존 사진이 없으면 리턴
//		if (picresult == null ) {
//			return;
//		}
		
		mypageDao.deleteUserPic(user);
		
	}
	@Override
	public Userpic getUserpic(User user) {
		return mypageDao.selectPicByUNo(user);
	}
	@Override
	public void update(User upuser) {
		mypageDao.updateUser(upuser);
		
	}
	@Override
	public String out(User outuser, HttpSession session) {
		int result = 0;
		result = mypageDao.selectUserCnt(outuser);
		if (result == 1) {
			mypageDao.deleteUser(outuser);
			session.invalidate();
		}
		return null;
		
	}
	@Override
	public MypageBoardPaging getBoardPaging(HashMap<String, Object> data) {
		
		logger.info("서비스쪽 data: {}", data);
		// 총 게시글 수 조회
		int totalCount = mypageDao.selectBoardCntAll(data);
		logger.info("totalCount는 : {}", totalCount);
		
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, (Integer) data.get("curPage"));
		return paging;
	}
	
	@Override
	public MypageBoardPaging getBookingPaging(HashMap<String, Object> data) {
		// 총 게시글 수 조회
		int totalCount = mypageDao.selectBookingCntAll(data);
		logger.info("totalCount는 : {}", totalCount);
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, (Integer) data.get("curPage"));
		return paging;
	}

	@Override
	public MypageBoardPaging getHospitalPaging(int curPage) {
		// 총 병원 수 조회
		int totalCount = mypageDao.selectHospitalCntAll();
		logger.info("totalCount는 : {}", totalCount);
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, curPage);
		return paging;
	}
	
	@Override
	public List<Board> getBoardByUser(HashMap<String, Object> data) {
		return mypageDao.selectAllBoard(data);
	}
	@Override
	public List<Booking> getBookingByUser(HashMap<String, Object> data) {
		return mypageDao.selectAllBooking(data);
	}
	@Override
	public Booking view(int bookno) {
		Booking viewdetail = mypageDao.selectBookingByBookno(bookno);
		return viewdetail;
	}
	@Override
	public void bookingCancel(Booking bookno) {
		mypageDao.updateBookingCancel(bookno);
		
	}
	@Override
	public MypageBoardPaging getPointPaging(HashMap<String, Object> data) {
		// 총 게시글 수 조회
		int totalCount = mypageDao.selectPointCntAll(data);
		logger.info("totalCount는 : {}", totalCount);
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, (Integer) data.get("curPage"));
		return paging;
	}
	@Override
	public List<Point> getPointByUser(HashMap<String, Object> data) {
		return mypageDao.selectAllPoint(data);
	}
	@Override
	public Point getCurpointByUser(int uNo) {
		return mypageDao.selectLastPoint(uNo);
	}
	@Override
	public MypageBoardPaging getPaging(int curPage) {
		// 총 게시글 수 조회
		int totalCount = mypageDao.selectHospitalCntAll();
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, curPage);
		return paging;
	}
	@Override
	public List<Hospital> hospitalList(MypageBoardPaging paging) {
		return mypageDao.selectAllHospital(paging);
	}
	@Override
	public MypageBoardPaging getHosBookingaging(int curPage) {
		// 총 예약 수 조회
		int totalCount = mypageDao.selectHosBookingCntAll();
		logger.info("totalCount는 : {}", totalCount);
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, curPage);
		return paging;
	}

	@Override
	public List<Booking> bookingList(MypageBoardPaging paging) {
		return mypageDao.selectAllHosBooking(paging);
	}
	
	@Override
	public int deleteHospital(HashMap<String, Object> map) {
		return mypageDao.deleteHospitals(map);
	}
	@Override
	public void bookingApprove(Booking booking) {
		mypageDao.updateBookingStatusY(booking);
		
	}
	@Override
	public void bookingReject(Booking booking) {
		mypageDao.updateBookingStatusN(booking);
		
	}
	@Override
	public MypageBoardPaging getBasketPaging(HashMap<String, Object> data) {
		// 총 예약 수 조회
		int totalCount = mypageDao.selectBasketCntAll(data);
		logger.info("totalCount는 : {}", totalCount);
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, (Integer) data.get("curPage"));
		return paging;
	}
	@Override
	public List<ShopBasket> basketList(HashMap<String, Object> data) {
		return mypageDao.selectAllBasket(data);
	}
	@Override
	public int basketSum(HashMap<String, Object> data) {
		return mypageDao.selectSumBasket(data);
	}
	@Override
	public int deleteBasket(int sbNo) {
		return mypageDao.deleteBasket(sbNo);
	}



}
