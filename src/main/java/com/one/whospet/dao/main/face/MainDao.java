package com.one.whospet.dao.main.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Hospital;

public interface MainDao {

	/**
	 * 신규 등록 병원 10개를 가져온다.
	 * 
	 * @return
	 */
	public List<Hospital> selectNewList();

	/**
	 * 최다 조회 병원 10개를 가져온다.
	 * 
	 * @return
	 */
	public List<Hospital> selectBestList();

	/**
	 * 베스트 리뷰 병원 10개를 가져온다.
	 * 
	 * @return
	 */
	public List<HashMap<String, Object>> selectBestReviewList();

}
