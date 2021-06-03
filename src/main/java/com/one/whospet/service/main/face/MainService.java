package com.one.whospet.service.main.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Hospital;

public interface MainService {

	/**
	 * 신규 등록 병원 목록을 가져오는 메소드
	 * 
	 * @return
	 */
	public List<Hospital> getNewList();

	/**
	 * 최다 조회 병원 목록을 가져오는 메소드
	 * 
	 * @return
	 */
	public List<Hospital> getBestList();

	/**
	 * 베스트 리뷰 병원 목록을 가져오는 메소드
	 * 
	 * @return
	 */
	public List<HashMap<String, Object>> getBestReviewList();

}
