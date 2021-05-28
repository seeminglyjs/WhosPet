package com.one.whospet.dao.shop.face;

import java.util.List;

import com.one.whospet.dto.Shop;
import com.one.whospet.util.ShopPaging;

public interface ShopDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	
	
	/**
	 * 페이징 적용된 전체 목록 게시글 조회
	 * 
	 * @param paging 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 리스트
	 */
	public List<Shop> selectPageList(ShopPaging paging);


	/**
	 * 상품번호로 상품정보 조회
	 * 
	 * @param shop 상품번호를 가진 객체
	 * @return 상품정보객체
	 */
	public Shop selectShopBySno(Shop viewShop);

}
