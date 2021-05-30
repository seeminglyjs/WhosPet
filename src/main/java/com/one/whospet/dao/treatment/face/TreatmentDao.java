package com.one.whospet.dao.treatment.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.Treatment;

public interface TreatmentDao {

   /**
    * 로그인한 유저 정보를 찾는 쿼리 메소드
    * 
    * @param map
    * @return
    */
   public List<HashMap<String, Object>> selectAllTreatment();

}