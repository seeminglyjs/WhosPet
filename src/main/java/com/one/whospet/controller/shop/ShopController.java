package com.one.whospet.controller.shop;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.whospet.dto.Shop;
import com.one.whospet.service.shop.face.ShopService;
import com.one.whospet.util.ShopPaging;

@Controller
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired ShopService shopService;
	
	//상품목록
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
		shopService.view(viewShop);
		logger.info("view 정보 : {}", shopService.view(viewShop));
		
		model.addAttribute("shop", shopService.view(viewShop));
	}
	
	
	//상품등록
	@RequestMapping(value="/shop/write", method=RequestMethod.GET )
	public void ShopWrite() {
		logger.info("/shop/write [GET]");
	}
	
	
	@RequestMapping(value="/shop/write", method=RequestMethod.POST)
	public void ShopWrite(Shop shop) {
		logger.info("/shop/write [POST]");
		logger.info("전달파라미터 shop : {}", shop);
	}
	
	
}
