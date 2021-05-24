package com.one.whospet.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopController {

	@RequestMapping(value="/shop/list", method=RequestMethod.GET)
	public String shopList() {
		
		return "shop/list";
	}
	
}
