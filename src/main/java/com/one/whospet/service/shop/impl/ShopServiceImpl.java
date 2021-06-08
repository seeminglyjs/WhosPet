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
import com.one.whospet.dto.Order;
import com.one.whospet.dto.Payment;
import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.dto.User;
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
			ShopImg shopImg = shopDao.selectThumbnailBySNo( i );
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

//------------------- 상품 수정 / 삭제 -----------------------------------------
	
	//상품정보 수정
	@Override
	public void updateShop(Shop shop) {
		logger.info("updateShop, Shop : {}", shop );
		shopDao.updateShopInfo( shop );
	}

	//수정시 추가될 첨부파일 추가하기
	@Override
	public void updateNewFileList( Shop shop, List<MultipartFile> newFileList) {
		logger.info("updateNewFileList, newFileList : {}", newFileList);
		//반복문으로 파일정보 리스트 형식으로 넣기
		for( MultipartFile file : newFileList) {
			if(file.getSize() == 0) {
				continue;
			}
			
			//파일이 저장될 경로(real path)
			String storedPath = context.getRealPath("/resources/shopimgupload");
			
			//파일이 존재하지 않으면 생성하기
			File stored = new File(storedPath);
			if( !stored.exists() ) {
				stored.mkdir();
			}
			
			//저장될 파일의 이름 생성하기
			String fileFullName = file.getOriginalFilename(); //원본파일
			logger.info("fileFullName : {}",fileFullName);
			int idx = fileFullName.indexOf(".");
			logger.info("인덱스 알려주세요 :{}", idx);
			
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
			
			shopDao.insertFile( shopImg );
		}
	}

	//수정시 삭제될 첨부파일 삭제하기
	@Override
	public void updateDelFileList(ArrayList<String> delFileList) {
		logger.info("deleteFile, delFileList 객체 : {} ", delFileList);
		for( String i : delFileList) {
			logger.info("i입니다 : {}",i);
			shopDao.deleteFileBySiNo( Integer.parseInt(i) );
		}
	}

	//상세보기에서 삭제 버튼 누르면 상품 삭제하기
	@Override
	public void deleteShop(Shop shop) {
		logger.info("delete, sNo : {}", shop.getsNo());
		
		shopDao.deleteShopImgBySNo(shop);
		shopDao.deleteShopBySNo(shop);
	}

	//장바구니 버튼 클릭시 장바구니 추가
	@Override
	public int basketAdd(Shop basketInfo) {
		logger.info("BasketAdd, basketInfo : {}", basketInfo);
		
		return shopDao.insertBasket(basketInfo);
	}

	//주문하는 사용자 정보 얻기
	@Override
	public User selectUserInfo(int uNo) {
		logger.info("selectUserInfo : {}", uNo);
		
		return shopDao.selectUserInfo(uNo);
	}

	//결제한 정보 추가하기
	@Override
	public void addPayment(Payment payment) {
		logger.info("addPayment",payment);
		
		shopDao.insertPayment(payment);
	}

	//주문한 정보 추가하기
	@Override
	public void addOrder(Order orderdata) {
		logger.info("addOrder : {}", orderdata);
		
		shopDao.insertOrder(orderdata);
	}

	




}
