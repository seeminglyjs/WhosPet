package com.one.whospet.controller.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.whospet.dto.Shop;
import com.one.whospet.dto.ShopImg;
import com.one.whospet.dto.User;
import com.one.whospet.service.shop.face.ShopService;
import com.one.whospet.util.ShopPaging;

@Controller
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired ShopService shopService;
	
	//상품목록 [GET]
	@RequestMapping(value="/admin/shopList", method=RequestMethod.GET)
	public String adminShopList( ShopPaging inData, Model model ) {
		logger.info("/admin/shopList [GET]");
		logger.info("indata cccc {}", inData.getCurPage());
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging( inData );
		logger.info("pagingbdhdhdghgdhgd: {}",paging);
		
		List<Shop> list = shopService.list( paging );
		logger.info(list.toString());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "admin/shopList";
	}
	
	//상품상세보기
	@RequestMapping(value="admin/shopView")
	public void adminShopView(Shop viewShop, Model model) {
		logger.info("/admin/shopView	[GET]");
		
		//게시글 번호를 통해 상세페이지 띄우기
		logger.info("전달파라미터 shop : {}", viewShop);
		Shop view = shopService.view(viewShop);
		logger.info("view 정보 : {}", view);
		
		model.addAttribute("shop", view);
		
		int sNo = view.getsNo();
		//첨부파일 조회하기 (siThumbnail = "N" 인 부분)
		List<ShopImg> shopImg = (List<ShopImg>) shopService.getAttachFile( sNo );
		
		//썸네일 첨부파일 조회하기 ( siThumbnail = "Y" 인 부분)
		ShopImg thumbnail = (ShopImg) shopService.getAttachThumbnailFile(sNo);
		
		logger.info("shopImg 정보 : {}", shopImg.toString());
		logger.info("thumbnail 정보 : {}", thumbnail.toString());
		model.addAttribute("shopImg",  shopImg);
		model.addAttribute("thumbnail", thumbnail);
	}
	
	
	//상품등록 [GET]
	@RequestMapping(value="/admin/shopRegister", method=RequestMethod.GET )
	public void adminShopRegister() {
		logger.info("/admin/shopRegister [GET]");
	}
	
	//상품등록 [POST]
	@RequestMapping(value="/admin/shopRegister", method=RequestMethod.POST)
	public String adminShopRegisterProc(Shop shop, MultipartHttpServletRequest mtfRequest,HttpSession session) {
		logger.info("/admin/shopRegister [POST]");
		
		logger.info("전달파라미터 shop : {}", shop);
		logger.info("받아오는 file 정보 : {}", mtfRequest);
		logger.info("session 정보 : {}", session.getAttribute("login"));
		logger.info("session 정보 : {}", (User) session.getAttribute("user"));
			
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		MultipartFile thumbnail = mtfRequest.getFile("thumbnail");
		fileList.add(thumbnail);
		logger.info("fileList : {}", fileList);
		logger.info("thumbnail : {}", thumbnail);
		
		int uNo = ( (User) (session.getAttribute("user")) ).getuNo();
		shop.setuNo(uNo);
		
		logger.info("삽입할 shop : {}", shop);
		shopService.register(shop,fileList);
		
		return "redirect:/admin/shopList";
	}
	
	//수정
	@RequestMapping(value="/admin/shopUpdate", method=RequestMethod.GET)
	public void adminShopUpdate( Shop shop, Model model) {
		logger.info("/admin/shopUpdate [GET]");
		logger.info("전달 파라미터 shop : {}",shop);
		
		//상품 수정 정보
		Shop updateView = shopService.view(shop);
		logger.info("updateView 정보 : {}", updateView);
		
		model.addAttribute("updateView", updateView);
		
		//상품 다중 첨부파일
		List<ShopImg> shopImg = shopService.getAttachFile(shop.getsNo());
		logger.info("Update shopImg 정보 : {}",shopImg);
		model.addAttribute("shopImg", shopImg);
		
		//상품 섬네일 첨부파일
		ShopImg thumbnail = shopService.getAttachThumbnailFile(shop.getsNo());
		logger.info("Update thumbnail 정보 : {}",thumbnail);
		model.addAttribute("thumbnail", thumbnail);
		
	}
	
	//수정
	@RequestMapping(value="/admin/shopUpdate", method=RequestMethod.POST)
	public String adminShopUpdateProc( Shop shop,MultipartHttpServletRequest mtfRequest ) {
		logger.info("/admin/shopUpdate [POST]");
		logger.info("update.jsp에서 전달받은 shop : {}", shop);
		logger.info("update.jsp에서 전달받은 mtfRequest : {}", mtfRequest);
		
		List<MultipartFile> newFileList = mtfRequest.getFiles("file");
		List<MultipartFile> deleteFileList = mtfRequest.getFiles("deleteFileList");
		
		logger.info("fileList : {}", newFileList);
		logger.info("fileList : {}", deleteFileList);
		
		
//		List<MultipartFile> fileList = mtfRequest.getFiles("file");
//		MultipartFile thumbnail = mtfRequest.getFile("thumbnail");
//		fileList.add(thumbnail);
//		logger.info("fileList : {}", fileList);
//		logger.info("thumbnail : {}", thumbnail);
		
		return "redirect:/admin/shopList";
	}
	
	
	
	
	
	
	
	
	
	
	
	//------------------------------------------------------------
	//------------------------------------------------------------
	// 사용자
	
	//상품목록
	@RequestMapping(value="/shop/list", method=RequestMethod.GET)
	public void shopList( ShopPaging inData, Model model ) {
		logger.info("/shop/list [GET]");
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging(inData);
		
		//상품 목록
		List<Shop> list = shopService.list(paging);
		logger.info("사용자 list : {}", list);
		
		//리스트, 페이징 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		//사용자 목록의 섬네일
		List<Integer> sNo = new ArrayList<Integer>();
		
		for( Shop i : list ) {
			sNo.add(i.getsNo());
		}
		logger.info("sNo만 뽑아낸 리스트 : {}", sNo);
		
		//사용자 목록의 섬네일 메소드
		List<ShopImg> userListThumbnail = shopService.getAttachThumbnailFiles( sNo );
		logger.info("UserListThumbnail만 뽑아낸 리스트 : {}", userListThumbnail);
		
		model.addAttribute("userListThumbnail", userListThumbnail);
		
	}
	
	
	//상품 상세보기
	@RequestMapping(value="/shop/view", method=RequestMethod.GET)
	public void shopView() {
		logger.info("/shop/view [GET]");
	}
	
	//------------------------------------------------------------
	//------------------------------------------------------------
	
	
	
	
}
