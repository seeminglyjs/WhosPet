package com.one.whospet.service.shop.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.whospet.dao.shop.face.ShopDao;
import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.service.shop.face.ShopService;
import com.one.whospet.util.ShopPaging;

@Service
public class ShopServiceImpl implements ShopService{

private static final Logger logger = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired private ShopDao shopDao;
	@Autowired ServletContext context; 
	
	
	@Override
	public ShopPaging getPaging(ShopPaging inData) {
		
		//총 게시글 수 조회
		int totalCount = shopDao.selectCntAll();
		logger.info("totalCount: {}", totalCount);
		//페이징 계산
		ShopPaging paging = new ShopPaging( totalCount, inData.getCurPage() );
		logger.info("페이징할거야 :{}",paging);
		return paging;
	}

	//목록조회
	@Override
	public List<Shop> list(ShopPaging paging) {
		logger.info("list 객체 호출: {}", shopDao.selectPageList(paging));
		
		
		return shopDao.selectPageList(paging);
	}
	
	
	//상세보기
	@Override
	public Shop view(Shop viewShop) {
		return shopDao.selectShopBySno( viewShop );
	}

	@Override
	public List<ShopImg> getAttachFile(int sNo) {
		
		return shopDao.selectShopImgBySNo( sNo );
	}

	//상세보기의 섬네일
	@Override
	public ShopImg getAttachThumbnailFile(int sNo) {
		return shopDao.selectThumbnailBySNo( sNo );
	}
	
	//사용자 목록의 섬네일
	@Override
	public List<ShopImg> getAttachThumbnailFiles(List<Integer> sNo) {
		
		List<ShopImg> list = new ArrayList<ShopImg>();
		
		for( int i : sNo ) {
			ShopImg shopImg = shopDao.selectThumbnailsBySNo( i );
			list.add(shopImg);

		}
		logger.info("list 전체 확인1 : {}",list);
		
		
		return list;
	}
	
	
	//상품등록하기
	@Override
//	@Transactional
	public void register(Shop shop, List<MultipartFile> fileList) {
		logger.info("register , shop 객체 : {}", shop);
		logger.info("register , file 객체 : {}", fileList);
		//게시글 정보 삽입
		shopDao.insertShop( shop );
		
		if( fileList.size() <= 0) {
			logger.info("파일사이즈가 0이하야");
			return;
		}
		
		
		
		logger.info("register , file 객체 여기까지오나? : {}", fileList);
		
		//반복문으로 파일정보 리스트 형식으로 넣기
		for( MultipartFile file : fileList) {
			
		
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("/resources/shopimgupload");
		
		//파일이 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		//저장될 파일의 이름 생성하기
		String fileFullName = file.getOriginalFilename(); //원본파일
		int idx = fileFullName.indexOf(".");
		String originName = fileFullName.substring(0, idx);
		String extension = FilenameUtils.getExtension(fileFullName);
		
		//원본파일이름에 UUID 추가하기(파일명이 중복되지않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4]	+ "." + extension;
		
		//저장될 파일 정보 객체
		File dest = new File(stored, storedName);
		
		try {
			//업로드된 파일 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//------------------------------
		
		logger.info("MultipartFile file : {}", (String) file.toString());
		
		ShopImg shopImg = new ShopImg();
		shopImg.setsNo(shop.getsNo());
		shopImg.setSiOriginFilename(fileFullName);
		shopImg.setSiStoredFilename(storedName);
		if( "thumbnail".equals( file.getName() ) ) {
			logger.info("getName() : {}",file.getName());
			
			shopImg.setSiThumbnail("Y");
		} else {
			shopImg.setSiThumbnail("N");
		}
		
		
		logger.info("shopImg 객체안의 sNo : {}", (String) shopImg.toString());
		//첨부파일 삽입
		shopDao.insertFile( shopImg );
		}
	}





}
