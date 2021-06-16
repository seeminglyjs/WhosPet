package com.one.whospet.controller.treatment;
import java.io.IOException;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.whospet.dto.Treatment;
import com.one.whospet.service.hospital.face.HospitalService;
import com.one.whospet.service.treatment.face.TreatmentService;
@Controller
public class TreatmentController {
   @Autowired
   private TreatmentService treatmentService;
   
   @Autowired
   private HospitalService hospitalService;
   
   @RequestMapping(value = "/treatment/treatmain", method = RequestMethod.GET)
   public String treatmainView(Model model) {
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      List<HashMap<String, Object>> newList = new ArrayList<HashMap<String, Object>>();
      List<String> as = new ArrayList<String>();

      for(HashMap<String,Object> m : treatmentList) {
         String a = (String)m.get("TR_NAME");
         if(!as.contains(a)) {
            as.add(a);
            newList.add(m);
         }
      }
      model.addAttribute("treatmentList", newList);
      model.addAttribute("numOftreat", treatmentList.size());
      model.addAttribute("numOfhospital", hospitalService.numOfhospital());
      
      
      List<HashMap<String, Object>> VList = new ArrayList<HashMap<String, Object>>();
      List<HashMap<String, Object>> SList = new ArrayList<HashMap<String, Object>>();
      List<HashMap<String, Object>> CList = new ArrayList<HashMap<String, Object>>();
      
      boolean isIn = false;
      
      // db의 병원 테이블에 TR_TYPE을 V, S, C로 나눠 검사 진료 수술로 1페이지에 띄우
      // 같은 진료항목이 반복되어 add되지 않게 중복검사 또한 실행 
      for(int i=0; i<treatmentList.size(); ++i) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if(treatment.get("TR_TYPE").equals("V"))
         {
            for(int j=0; j<VList.size(); ++j) {
               if(VList.get(j).get("TR_NAME").equals(treatment.get("TR_NAME"))) {
                  isIn = true;
               }
            }
            if(isIn == false) {
               VList.add((treatmentList.get(i)));
            }
            isIn = false;
         }
         else if(treatmentList.get(i).get("TR_TYPE").equals("S"))
         {
            for(int j=0; j<SList.size(); ++j) {
               if(SList.get(j).get("TR_NAME").equals(treatment.get("TR_NAME"))) {
                  isIn = true;
               }
            }
            if(isIn == false) {
               SList.add((treatmentList.get(i)));
            }
            isIn = false;
         }
         else if(treatmentList.get(i).get("TR_TYPE").equals("C"))
         {
            for(int j=0; j<CList.size(); ++j) {
               if(CList.get(j).get("TR_NAME").equals(treatment.get("TR_NAME"))) {
                  isIn = true;
               }
            }
            if(isIn == false) {
               CList.add((treatmentList.get(i)));
            }
            isIn = false;
         }
      }
      //모델에 담아서 jsp에 전달 
      model.addAttribute("treatmentList", newList);
      model.addAttribute("VList", VList);
      model.addAttribute("SList", SList);
      model.addAttribute("CList", CList);
      return "treatment/treatmain";
   }
   
   @RequestMapping(value = "/treatment/treatdetail", method = RequestMethod.GET)
   public String treatdetailView(Model model, @RequestParam("no") int no, HttpSession session) {
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      session.setAttribute("TR_NO", no);
      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if(((BigDecimal)treatment.get("TR_NO")).intValue() == no) {
            model.addAttribute("treatment", treatment);
         }
      }
      return "treatment/treatdetail";
   }
   
   @ResponseBody
   @RequestMapping(value = "/treatment/treatdetail", method = RequestMethod.POST)
   public List<HashMap<String, Object>> treatdetail(Model model, @RequestParam Map<String, Object> map, HttpSession session, HttpServletResponse response, HttpServletRequest request)
   {
      List<HashMap<String, Object>> hospitalList = hospitalService.allHospital();
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      List<HashMap<String, Object>> cityList = new ArrayList<HashMap<String, Object>>();
      List<HashMap<String, Object>> districtList = new ArrayList<HashMap<String, Object>>();
      String tr_name = new String();
      int tr_no = Integer.parseInt(session.getAttribute("TR_NO").toString());
      int totalPrice = 0;
      int cityMin = 0, cityMax = 0;
      int districtMin = 0, districtMax = 0;
      int totalMin = 0, totalMax = 0;
      
      int cityPrice = 0;
      int cityNum = 0;
      int districtPrice = 0;
      int districtNum = 0;
      
      // 1페이지에서 클릭 또는 검색을 통해 2페이지로 넘어올때 그 검사 항목의 이름
      //bigdecimal 사용 -> 돈과,소수점, 큰숫자 사용시 bigdecimal이 정밀도가 높음 
      //intValue() String이아닌 integer객체에서 int형 값으로파싱할때 사용  

      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if(((BigDecimal)treatment.get("TR_NO")).intValue() == tr_no)
         {
            tr_name = treatment.get("TR_NAME").toString();
         }
      }
      
      List<HashMap<String, Object>> curTreatmentList = treatmentService.selectAllByName(tr_name);
      totalMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      totalMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      // 전국 최저 평균 최대값 
      for(int i = 0; i < curTreatmentList.size(); i++) {
         HashMap<String, Object> curTreatment = curTreatmentList.get(i);
         if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) < totalMin)
            totalMin = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
         if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) > totalMax)
            totalMax = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
         totalPrice += Integer.parseInt(curTreatment.get("TR_PRICE").toString());
      }
      
      totalPrice = (int)(totalPrice / curTreatmentList.size());
      
      
      List<HashMap<String, Object>> orderedList = new ArrayList<HashMap<String, Object>>();
      String[] temp = map.get("district").toString().split(" ");
      
      //jsp에서 받은 주소를 시와 군으로 나눈다. (용인시/ 수지구 등)
      if(temp.length == 1) {
         for(int i = 0; i < hospitalList.size(); i++) {
            HashMap<String, Object> hospital = hospitalList.get(i);
            if(((String)hospital.get("H_ROAD_ADDRESS")).contains(map.get("city").toString())){
               cityList.add(hospital);
            }
         }
         for(int i = 0; i < cityList.size(); i++) {
            HashMap<String, Object> city = cityList.get(i);
            if(((String)city.get("H_ROAD_ADDRESS")).contains(map.get("district").toString())){
               districtList.add(city);
            }
         }
      }
      else {
         for(int i = 0; i < hospitalList.size(); i++) {
            HashMap<String, Object> hospital = hospitalList.get(i);
            if(((String)hospital.get("H_ROAD_ADDRESS")).contains(map.get("city").toString())){
               cityList.add(hospital);
            }
         }
         for(int i = 0; i < cityList.size(); i++) {
            HashMap<String, Object> city = cityList.get(i);
            if(((String)city.get("H_ROAD_ADDRESS")).contains(temp[0])){
               districtList.add(city);
            }
         }
      }
      // hit 높은순으로 정렬 
      if(districtList.size() != 0) {
         Collections.sort(districtList, new Comparator<HashMap<String, Object>>() {
            @Override
            public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
               
               Integer age1 = Integer.parseInt(String.valueOf(o1.get("H_HIT")));
               Integer age2 = Integer.parseInt(String.valueOf(o2.get("H_HIT")));
               return age2.compareTo(age1);
            }
         });
      }
      int len = districtList.size();
      if(len > 5) {
         len = 5;
      }
      // 정렬후 5개만 나오게 orderlist에 저장 -> 5개보다 적으면 그 갯수나오게 
      for(int i = 0; i < len; i++) {
         HashMap<String, Object> district = districtList.get(i);
         orderedList.add(district);
      }
      
      cityMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      cityMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      
      // XX시 최정 평균 최대값 구하기 
      for(int i = 0; i < cityList.size(); i++) {
         HashMap<String, Object> city = cityList.get(i);
         for(int j = 0; j < curTreatmentList.size(); j++) {
            HashMap<String, Object> curTreat = curTreatmentList.get(j);
            if(city.get("H_NO").equals(curTreat.get("H_NO"))) {
               
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < cityMin)
                  cityMin = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > cityMax)
                  cityMax = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               
               cityPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
               cityNum++;
            }
         }
      }

      districtMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      districtMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      
      //위와 코드는 같음, xx구 최저 , 평균 , 최대값 구하기 
      for(int i = 0; i < districtList.size(); i++) {
         HashMap<String, Object> district = districtList.get(i);
         for(int j = 0; j < curTreatmentList.size(); j++) {
            HashMap<String, Object> curTreat = curTreatmentList.get(j);
            if(district.get("H_NO").equals(curTreat.get("H_NO"))) {
               
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < districtMin)
                  districtMin = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > districtMax)
                  districtMax = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               
               districtPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
               districtNum++;
            }
         }
      }

      //위에서 구한 최저 , 평균 , 최대값 orderList에 모두 담고 jsp로 전달 
      
      cityPrice = (int)(cityPrice / cityNum);
      districtPrice = (int)(districtPrice / districtNum); // 금정구없어서 0임  0을 나눌시 arithmatic exception뜸데이터 정보넣어주면사라짐 DB에서 
      session.setAttribute("cityPrice", cityPrice);
      session.setAttribute("districtPrice", districtPrice);
      session.setAttribute("totalPrice", totalPrice);
      
      System.out.println("cityPrice= " + cityPrice);
      System.out.println("districtPrice= " + session.getAttribute("districtPrice"));
      System.out.println("totalPrice= " + totalPrice);
      HashMap<String, Object> mapSender = new HashMap<String, Object>();
      mapSender.put("cityPrice", cityPrice);
      mapSender.put("districtPrice", districtPrice);
      mapSender.put("totalPrice", totalPrice);
      mapSender.put("cityMin", cityMin);
      mapSender.put("cityMax", cityMax);
      mapSender.put("totalMin", totalMin);
      mapSender.put("totalMax", totalMax);
      mapSender.put("districtMin", districtMin);
      mapSender.put("districtMax", districtMax);
      
      orderedList.add(mapSender);
      
      
      session.setAttribute("orderedList", orderedList);
      
      return orderedList;
   }
   
   
   //여기서부턴 위와 같은 코드임 , 하지만 url이 다름 접근방식이 다를수 있어  url다르게 만들어놓음 

   
   @RequestMapping(value = "/treatment/treatdetailSelect", method = RequestMethod.GET)
   public String treatdetailSelectView(Model model, @RequestParam("no") int no, HttpSession session) {
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      session.setAttribute("TR_NO", no);
      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if(((BigDecimal)treatment.get("TR_NO")).intValue() == no) {
            model.addAttribute("treatment", treatment);
         }
      }
      return "treatment/treatdetail";
   }
   
   @ResponseBody
   @RequestMapping(value = "/treatment/treatdetailSelect", method = RequestMethod.POST)
   public List<HashMap<String, Object>> treatdetailSelect(Model model, @RequestParam Map<String, Object> map, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException
   {
      List<HashMap<String, Object>> hospitalList = hospitalService.allHospital();
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      List<HashMap<String, Object>> cityList = new ArrayList<HashMap<String, Object>>();
      List<HashMap<String, Object>> districtList = new ArrayList<HashMap<String, Object>>();
      List<HashMap<String, Object>> orderedList = new ArrayList<HashMap<String, Object>>();
      int count = 0 ;
      for(int i = 0; i < hospitalList.size(); i++) {
         HashMap<String, Object> hospital = hospitalList.get(i);
         if(hospital.get("H_ROAD_ADDRESS").toString().contains(map.get("district").toString()) && 
               hospital.get("H_ROAD_ADDRESS").toString().contains(map.get("city").toString())) {
            break;
         }
         else count++;
      }
      if(count == hospitalList.size()) {
         
         return orderedList;
      }

      
      String tr_name = new String();
      int tr_no = Integer.parseInt(session.getAttribute("TR_NO").toString());
      int totalPrice = 0;
      int cityMin = 0, cityMax = 0;
      int districtMin = 0, districtMax = 0;
      int totalMin = 0, totalMax = 0;
      
      int cityPrice = 0;
      int cityNum = 0;
      int districtPrice = 0;
      int districtNum = 0;
      
      
      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if(((BigDecimal)treatment.get("TR_NO")).intValue() == tr_no)
         {
            tr_name = treatment.get("TR_NAME").toString();
         }
      }
      
      List<HashMap<String, Object>> curTreatmentList = treatmentService.selectAllByName(tr_name);
      totalMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      totalMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      for(int i = 0; i < curTreatmentList.size(); i++) {
         HashMap<String, Object> curTreatment = curTreatmentList.get(i);
         if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) < totalMin)
            totalMin = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
         if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) > totalMax)
            totalMax = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
         totalPrice += Integer.parseInt(curTreatment.get("TR_PRICE").toString());
      }
      
      totalPrice = (int)(totalPrice / curTreatmentList.size());
      
      
      String[] temp = map.get("district").toString().split(" ");
      
      if(temp.length == 1) {
         for(int i = 0; i < hospitalList.size(); i++) {
            HashMap<String, Object> hospital = hospitalList.get(i);
            if(((String)hospital.get("H_ROAD_ADDRESS")).contains(map.get("city").toString())){
               cityList.add(hospital);
            }
         }
         for(int i = 0; i < cityList.size(); i++) {
            HashMap<String, Object> city = cityList.get(i);
            if(((String)city.get("H_ROAD_ADDRESS")).contains(map.get("district").toString())){
               districtList.add(city);
            }
         }
      }
      else {
         for(int i = 0; i < hospitalList.size(); i++) {
            HashMap<String, Object> hospital = hospitalList.get(i);
            if(((String)hospital.get("H_ROAD_ADDRESS")).contains(map.get("city").toString())){
               cityList.add(hospital);
            }
         }
         for(int i = 0; i < cityList.size(); i++) {
            HashMap<String, Object> city = cityList.get(i);
            if(((String)city.get("H_ROAD_ADDRESS")).contains(temp[0])){
               districtList.add(city);
            }
         }
      }
      
      if(districtList.size() != 0) {
         Collections.sort(districtList, new Comparator<HashMap<String, Object>>() {
            @Override
            public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
               
               Integer age1 = Integer.parseInt(String.valueOf(o1.get("H_HIT")));
               Integer age2 = Integer.parseInt(String.valueOf(o2.get("H_HIT")));
               return age2.compareTo(age1);
            }
         });
      }
      
      int len = districtList.size();
      if(len > 5)
         len = 5;
      for(int i = 0; i < len; i++) {
         HashMap<String, Object> district = districtList.get(i);
         orderedList.add(district);
      }
      
      cityMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      cityMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      for(int i = 0; i < cityList.size(); i++) {
         HashMap<String, Object> city = cityList.get(i);
         for(int j = 0; j < curTreatmentList.size(); j++) {
            HashMap<String, Object> curTreat = curTreatmentList.get(j);
            if(city.get("H_NO").equals(curTreat.get("H_NO"))) {
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < cityMin)
                  cityMin = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > cityMax)
                  cityMax = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               
               cityPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
               cityNum++;
            }
         }
      }

      districtMin = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      districtMax = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
      
      for(int i = 0; i < districtList.size(); i++) {
         HashMap<String, Object> district = districtList.get(i);
         for(int j = 0; j < curTreatmentList.size(); j++) {
            HashMap<String, Object> curTreat = curTreatmentList.get(j);
            if(district.get("H_NO").equals(curTreat.get("H_NO"))) {
               
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < districtMin)
                  districtMin = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > districtMax)
                  districtMax = Integer.parseInt(curTreat.get("TR_PRICE").toString());
               
               districtPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
               districtNum++;
            }
         }
      }

      cityPrice = (int)(cityPrice / cityNum);
      districtPrice = (int)(districtPrice / districtNum); // 금정구없어서 0임
      session.setAttribute("cityPrice", cityPrice);
      session.setAttribute("districtPrice", districtPrice);
      session.setAttribute("totalPrice", totalPrice);
      
      
      System.out.println("cityPrice= " + cityPrice);
      System.out.println("districtPrice= " + session.getAttribute("districtPrice"));
      System.out.println("totalPrice= " + totalPrice);
      HashMap<String, Object> mapSender = new HashMap<String, Object>();
      mapSender.put("cityPrice", cityPrice);
      mapSender.put("districtPrice", districtPrice);
      mapSender.put("totalPrice", totalPrice);
      mapSender.put("cityMin", cityMin);
      mapSender.put("cityMax", cityMax);
      mapSender.put("totalMin", totalMin);
      mapSender.put("totalMax", totalMax);
      mapSender.put("districtMin", districtMin);
      mapSender.put("districtMax", districtMax);
      
      orderedList.add(mapSender);
      
      session.setAttribute("orderedList", orderedList);
      
      return orderedList;
   }

   @RequestMapping(value = "/treatment/treatSearch", method = RequestMethod.POST)
   public String treatSearch(Model model, @RequestParam("Search-box") String content, HttpServletResponse response, HttpServletRequest request)
   {
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if((treatment.get("TR_NAME")).equals(content)) {
            model.addAttribute("treatment", treatment);
            return "treatment/treatdetail";
         }
      }
      return "redirect: treatmain";
      
   }
   
   @RequestMapping(value = "/treatment/treatSearchDetail", method = RequestMethod.POST)
   public String treatSearchDetail(Model model, @RequestParam("Search-box") String content, HttpServletResponse response, HttpServletRequest request, HttpSession session)
   {
      
      List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();

      for(int i = 0; i < treatmentList.size(); i++) {
         HashMap<String, Object> treatment = treatmentList.get(i);
         if((treatment.get("TR_NAME")).equals(content)) {
            model.addAttribute("treatment", treatment);
            session.setAttribute("TR_NO", treatment.get("TR_NO"));
            return "treatment/treatdetail";
         }
      }

      return "redirect: treatmain";
      

      
   }
   
}