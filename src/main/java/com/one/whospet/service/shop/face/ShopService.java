package com.one.whospet.service.shop.face;

import java.util.List;

import com.one.whospet.dto.Shop;
import com.one.whospet.util.ShopPaging;

public interface ShopService {

	
	/**
	 * 쇼핑몰 목록을 위한 페이징 객체를 생성한다
	 * 파라미터 객체의 curPage(현재 페이지)와 DB에서 조회한 totalCount(총 게시글 수)를 이용한다
	 * 
	 * @param indata - curPage(현제페이지)를 저장하고 있는 Paging 객체
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public ShopPaging getPaging(ShopPaging inData);

	/**
	 * 페이징 처리된 쇼핑몰 목록
	 * 
	 * @param paging 페이징 처리 객체
	 * @return 페이징 처리된 쇼핑몰 목록
	 */
	public List<Shop> list(ShopPaging paging);

	/**
	 * 상품번호를 통해 상품상세정보 객체 얻기
	 * 
	 * @param shop 쿼리스트링으로 게시글 번호를 전달받은 객체
	 */
	public Shop view(Shop viewShop);

}
