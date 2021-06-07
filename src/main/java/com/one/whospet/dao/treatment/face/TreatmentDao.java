package com.one.whospet.dao.treatment.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Treatment;

public interface TreatmentDao {

   /**
    * 등록된 모든 진료항목을 찾음.
    * 
    * @param 
    * @return List 
    */
   public List<HashMap<String, Object>> selectAllTreatment();

   public List<HashMap<String, Object>> selectAllByName(String tr_name);

}