package com.one.whospet.dao.disease.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Disease;

public interface DiseaseDao {

	public List<Disease> selectEyeList();
	 
	public List<Disease> selectBehaviorList();	
	

	public List<Disease> selectByQno(int dQNo);
	
	public List<Disease> selectByDNo(int dNo);
	
}
