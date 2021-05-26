package com.one.whospet.service.mypage.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dao.mypage.face.MypageDao;
import com.one.whospet.dto.User;
import com.one.whospet.dto.Userpic;
import com.one.whospet.service.mypage.face.MypageService;


@Service
public class MypageServiceImpl implements MypageService {

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


}
