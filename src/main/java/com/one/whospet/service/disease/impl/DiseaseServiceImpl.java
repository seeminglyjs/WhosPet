package com.one.whospet.service.disease.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.disease.face.DiseaseDao;
import com.one.whospet.dto.Disease;
import com.one.whospet.service.disease.face.DiseaseService;

@Service
public class DiseaseServiceImpl implements DiseaseService {
	
	@Autowired
	private DiseaseDao diseasedao;

	@Override
	public List<Disease> getEyeList() {
		List<Disease> eyeList = new ArrayList<Disease>();
		
		eyeList = diseasedao.selectEyeList();
		return eyeList;
	}

	@Override
	public List<Disease> getBehaviorList() {
		List<Disease> behaviorList = new ArrayList<Disease>();
		
		behaviorList = diseasedao.selectBehaviorList();
		return behaviorList;
	}
	
	@Override
	public List<Disease> getNoseList() {
		List<Disease> noseList = new ArrayList<Disease>();
		
		noseList = diseasedao.selectNoseList();
		return noseList;
	}
	
	@Override
	public List<Disease> getFoodList() {
		List<Disease> foodList = new ArrayList<Disease>();
		
		foodList = diseasedao.selectFoodList();
		return foodList;
	}
	
	@Override
	public List<Disease> getAirList() {
		List<Disease> airList = new ArrayList<Disease>();
		
		airList = diseasedao.selectAirList();
		return airList;
	}
	
	@Override
	public List<Disease> getUrineList() {
		List<Disease> urineList = new ArrayList<Disease>();
		
		urineList = diseasedao.selectBehaviorList();
		return urineList;
	}

	@Override
	public List<Disease> getViewList(int dQNo){
		List<Disease> viewList = new ArrayList<Disease>();
		
		viewList = diseasedao.selectByQno(dQNo);
		return viewList;
	
		
	}

	@Override
	public List<Disease> getResultList(int dNo) {
		List<Disease> resultList = new ArrayList<Disease>();
		
		resultList = diseasedao.selectByDNo(dNo);
		return resultList;
	}
	
	

	
	
	
	
	
}
