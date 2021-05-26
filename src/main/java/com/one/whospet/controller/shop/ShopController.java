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
	
	@RequestMapping(value="/shop/list", method=RequestMethod.GET)
	public String shopList( ShopPaging inData, Model model ) {
		logger.info("/shop/list [GET]");
		
		//페이징 계산
		ShopPaging paging = shopService.getPaging( inData );
		logger.info("paging: {}",paging);
		
		List<Shop> list = shopService.list( paging );
		
		return "shop/list";
	}
	
	
}
