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
		
		String storedPath = context.getRealPath("resources/upload");
		
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
	public MypageBoardPaging getPaging(HashMap<String, Object> data) {
		
		logger.info("서비스쪽 data: {}", data);
		// 총 게시글 수 조회
		int totalCount = mypageDao.selectCntAll(data);
		logger.info("totalCount는 : {}", totalCount);
		
		MypageBoardPaging paging = new MypageBoardPaging(totalCount, (Integer) data.get("curPage"));
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



}
