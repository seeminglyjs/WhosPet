package com.one.whospet.service.shop.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.shop.face.ShopDao;
import com.one.whospet.dto.Shop;
import com.one.whospet.service.shop.face.ShopService;
import com.one.whospet.util.ShopPaging;

@Service
public class ShopServiceImpl implements ShopService{

private static final Logger logger = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Autowired private ShopDao shopDao;
	
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

	@Override
	public List<Shop> list(ShopPaging paging) {
		logger.info("list 객체 호출: {}", shopDao.selectPageList(paging));
		
		
		return shopDao.selectPageList(paging);
	}

	@Override
	public Shop view(Shop viewShop) {
		return shopDao.selectShopBySno( viewShop );
	}

}
