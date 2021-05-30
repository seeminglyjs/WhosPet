package com.one.whospet.service.treatment.face;

import java.util.HashMap;
import java.util.List;

import com.one.whospet.dto.User;

public interface TreatmentService {

   /**
    *로그인한 유저 정보를 찾는 메소드 
    * 
    * @param map  -> id 와 pw 가 들어 있다.
    * @return
    */
   public List<HashMap<String, Object>> selectAllTreatment();
}