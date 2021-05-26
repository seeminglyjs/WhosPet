package com.one.whospet.service.shop.face;

import java.util.List;

import com.one.whospet.dto.Shop;
import com.one.whospet.util.Paging;

public interface ShopService {

	
	/**
	 * 쇼핑몰 목록을 위한 페이징 객체를 생성한다
	 * 파라미터 객체의 curPage(현재 페이지)와 DB에서 조회한 totalCount(총 게시글 수)를 이용한다
	 * 
	 * @param indata - curPage(현제페이지)를 저장하고 있는 Paging 객체
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(Paging inData);

	/**
	 * 페이징 처리된 쇼핑몰 목록
	 * 
	 * @param paging 페이징 처리 객체
	 * @return 페이징 처리된 쇼핑몰 목록
	 */
	public List<Shop> list(Paging paging);

}
