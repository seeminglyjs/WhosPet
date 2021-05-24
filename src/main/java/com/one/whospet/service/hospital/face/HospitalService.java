package com.one.whospet.service.hospital.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Review;
import com.one.whospet.util.HospitalPaging;

public interface HospitalService {
	
	/**
	 * 병원 전체 조회 
	 * @param paging 
	 * @return
	 */
	public List<Map<String, Object>> getHospital(HospitalPaging paging);
	/**
	 * paging객체 얻어오기 
	 * @param curPage
	 * @return
	 */
	public HospitalPaging getPaging(int curPage);
	/**
	 * 검색데이터 조회
	 * @param map
	 * @return
	 */
	public List<HashMap<String, Object>> search(HashMap<String, String> map);
	/**
	 * 검색정보(총 게시물수, 검색내용) 조회
	 * @param map
	 * @return
	 */
	public HashMap<String, Object> getSearchinfo(HashMap<String, String> map);
	/**
	 * 상세보기 가져오기
	 * @param hNo
	 * @return
	 */
	public Hospital getView(int hNo);
	/**
	 * 리뷰 가져오기
	 * @param hNo
	 * @return
	 */
	public List<HashMap<String, Object>> getReview(int hNo);

}
