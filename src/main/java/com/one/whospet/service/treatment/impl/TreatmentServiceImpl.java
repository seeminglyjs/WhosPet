package com.one.whospet.service.treatment.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.whospet.dao.login.face.LoginDao;
import com.one.whospet.dao.treatment.face.TreatmentDao;
import com.one.whospet.dto.User;
import com.one.whospet.service.login.face.LoginService;
import com.one.whospet.service.treatment.face.TreatmentService;

@Service
public class TreatmentServiceImpl implements TreatmentService {

   
   @Autowired
   private TreatmentDao treatmentdao;
   
   @Override
   public List<HashMap<String, Object>> selectAllTreatment() {

      //로그인 유정 정보를 찾는 쿼리 메소드
      List<HashMap<String, Object>> treatments = treatmentdao.selectAllTreatment();
            
      return treatments;
   }

   @Override
   public List<HashMap<String, Object>> selectAllByName(String tr_name){
	   return treatmentdao.selectAllByName(tr_name);
   }


}