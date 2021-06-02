package com.one.whospet.service.treatment.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.User;

public interface TreatmentService {

   /**
    * 모든 진료 항목 가져오기 
    * 
    * @param
    * @return
    */
   public List<HashMap<String, Object>> selectAllTreatment();
}