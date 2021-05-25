package com.one.whospet.service.hospital.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.hospital.face.HospitalDao;
import com.one.whospet.dto.Booking;
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
	public List<HashMap<String, Object>> search(HashMap<String, Object> map) {
		return hospitalDao.selectKeyword(map);
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

	@Override
	public int getTotalCount(HashMap<String, Object> map) {
		return hospitalDao.selectCntAllKeyword(map);
	}
	
	@Override
	public int book(HashMap<String, Object> map) {
		return hospitalDao.insertBook(map);
	}
	@Override
	public int addReview(HashMap<String, Object> map) {
		return hospitalDao.insertReview(map);
	}
}
