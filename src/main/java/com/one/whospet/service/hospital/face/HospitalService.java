package com.one.whospet.service.hospital.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.whospet.dto.Hospital;
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
	public List<Hospital> search(HashMap<String, String> map);
	public HashMap<String, Object> getSearchinfo(HashMap<String, String> map);

}
