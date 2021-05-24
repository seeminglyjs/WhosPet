package com.one.whospet.service.hospital.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.hospital.face.HospitalDao;
import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Review;
import com.one.whospet.service.hospital.face.HospitalService;
import com.one.whospet.util.HospitalPaging;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired HospitalDao hospitalDao;
	
	@Override
	public List<Map<String, Object>> getHospital(HospitalPaging paging) {
		return hospitalDao.selectAll(paging);
	}
	
	@Override
	public HospitalPaging getPaging(int curPage) {
		
		int totalCount = hospitalDao.selectCntAll();
		
		HospitalPaging paging = new HospitalPaging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> search(HashMap<String, String> map) {
		return hospitalDao.selecKeyword(map);
	}
	
	@Override
	public HashMap<String, Object> getSearchinfo(HashMap<String, String> map) {
		HashMap<String, Object> info = hospitalDao.selectCntKeyword(map);
		info.put("keyword", map.get("keyword"));
		return info;
	}
	
	@Override
	public Hospital getView(int hNo) {
		hospitalDao.updateHit(hNo);
		return hospitalDao.selectByhNo(hNo);
	}
	
	@Override
	public List<HashMap<String, Object>> getReview(int hNo) {
		return hospitalDao.selectReview(hNo);
	}
	
}
