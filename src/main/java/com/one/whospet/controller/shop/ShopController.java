package com.one.whospet.controller.shop;

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
	@RequestMapping(value="/shop/list", method=RequestMethod.GET)
	public String shopList( ShopPaging inData, Model model ) {
		logger.info("/shop/list [GET]");
		logger.info("indata cccc {}", inData.getCurPage());
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging( inData );
		logger.info("pagingbdhdhdghgdhgd: {}",paging);
		
		List<Shop> list = shopService.list( paging );
		logger.info(list.toString());
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "shop/list";
	}
	
	//상품상세보기
	@RequestMapping(value="/shop/view")
	public void shopView(Shop viewShop, Model model) {
		logger.info("/shop/view	[GET]");
		
		//게시글 번호를 통해 상세페이지 띄우기
		logger.info("전달파라미터 shop : {}", viewShop);
		Shop view = shopService.view(viewShop);
		logger.info("view 정보 : {}", view);
		
		model.addAttribute("shop", view);
		
		int sNo = view.getsNo();
		logger.info(String.valueOf(sNo));
		//첨부파일 조회하기
		ShopImg shopImg = shopService.getAttachFile( sNo );
		logger.info("shopImg 정보 : {}", shopImg.toString());
		model.addAttribute("shopImg", shopImg.getSiStoredFilename());
	}
	
	
	//상품등록 [GET]
	@RequestMapping(value="/shop/register", method=RequestMethod.GET )
	public void ShopRegister() {
		logger.info("/shop/register [GET]");
	}
	
	//상품등록 [POST]
	@RequestMapping(value="/shop/register", method=RequestMethod.POST)
	public String ShopRegisterProc(Shop shop, MultipartFile file,HttpSession session) {
		logger.info("/shop/register [POST]");
		logger.info("전달파라미터 shop : {}", shop);
		logger.info("받아오는 file 정보 : {}", file);
		logger.info("session 정보 : {}", session.getAttribute("login"));
		logger.info("session 정보 : {}", (User) session.getAttribute("user"));
//		logger.info("session 정보 : {}", session.getAttribute("user").toString()) ;
//		logger.info("session 정보 : {}", ( (User) (session.getAttribute("user")) ).getuNo()   ) ;
		int uNo = ( (User) (session.getAttribute("user")) ).getuNo();
		shop.setuNo(uNo);
		logger.info("삽입할 shop : {}", shop);
		
		
		shopService.register(shop,file);
		
		return "redirect:/shop/list";
	}
	
	
}
