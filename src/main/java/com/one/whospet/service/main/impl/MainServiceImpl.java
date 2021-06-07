package com.one.whospet.service.main.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.main.face.MainDao;
import com.one.whospet.dto.Hospital;
import com.one.whospet.service.main.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	// 로거 객체
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

	//Dao 객체 등록
	@Autowired
	MainDao mainDao;

	@Override // 신규 등록 병원 목록을 가져오는 메소드
	public List<Hospital> getNewList() {
		
		List<Hospital> newHospitalList = new ArrayList<Hospital>();
		
		newHospitalList = mainDao.selectNewList();
		
		return newHospitalList;
	}
	
	@Override // 최다 조회 병원 목록을 가져오는 메소드
	public List<Hospital> getBestList() {
		
		List<Hospital> bestHospitalList = new ArrayList<Hospital>();
		
		bestHospitalList = mainDao.selectBestList();
		
		return bestHospitalList;
	}
	
	@Override // 베스트 리뷰 병원 목록을 가져오는 메소드
	public List<HashMap<String, Object>> getBestReviewList() {
		
		List<HashMap<String,Object>> bestReviewList = new ArrayList<HashMap<String,Object>>();
		
		bestReviewList = mainDao.selectBestReviewList();
		
		return bestReviewList;
	}
	
	@Override // 검색 결과를 받아 치료번호를 가져온다.
	public String getTreatNo(String data) {
		
		String no = mainDao.selecTreatNo(data);
		
		return no;
	}
}
