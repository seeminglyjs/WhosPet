package com.one.whospet.service.disease.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Disease;


public interface DiseaseService {
	
	public List<Disease> getEyeList();
	
	public List<Disease> getBehaviorList();
	
	public List<Disease> getViewList(int dQNo);

	public List<Disease> getResultList(int dNo);
	
}
