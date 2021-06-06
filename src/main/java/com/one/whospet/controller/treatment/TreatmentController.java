package com.one.whospet.controller.treatment;
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
		System.out.println("hello world");
		List<HashMap<String, Object>> hospitalList = hospitalService.allHospital();
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		List<HashMap<String, Object>> cityList = new ArrayList<HashMap<String, Object>>();
		List<HashMap<String, Object>> districtList = new ArrayList<HashMap<String, Object>>();
		String tr_name = new String();
		int tr_no = Integer.parseInt(session.getAttribute("TR_NO").toString());
		int totalPrice = 0;
		int min = 0, max = 0;
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
		min = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		max = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		for(int i = 0; i < curTreatmentList.size(); i++) {
			HashMap<String, Object> curTreatment = curTreatmentList.get(i);
			if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) < min)
				min = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
			if(Integer.parseInt(curTreatment.get("TR_PRICE").toString()) > max)
				max = Integer.parseInt(curTreatment.get("TR_PRICE").toString());
			totalPrice += Integer.parseInt(curTreatment.get("TR_PRICE").toString());
		}
		
		totalPrice = (int)(totalPrice / curTreatmentList.size());
		session.setAttribute("totalMin", min);
		session.setAttribute("totalMax", max);
		
		
		List<HashMap<String, Object>> orderedList = new ArrayList<HashMap<String, Object>>();
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
		
		for(int i = 0; i < 5; i++) {
			HashMap<String, Object> district = districtList.get(i);
			orderedList.add(district);
		}
		
		min = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		max = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		
		for(int i = 0; i < cityList.size(); i++) {
			HashMap<String, Object> city = cityList.get(i);
			for(int j = 0; j < curTreatmentList.size(); j++) {
				HashMap<String, Object> curTreat = curTreatmentList.get(j);
				if(city.get("H_NO").equals(curTreat.get("H_NO"))) {
					
					if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < min)
						min = Integer.parseInt(curTreat.get("TR_PRICE").toString());
					if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > max)
						max = Integer.parseInt(curTreat.get("TR_PRICE").toString());
					
					cityPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
					cityNum++;
				}
			}
		}
		
		session.setAttribute("cityMin", min);
		session.setAttribute("cityMax", max);

		min = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		max = Integer.parseInt((curTreatmentList.get(0).get("TR_PRICE").toString()));
		
		for(int i = 0; i < districtList.size(); i++) {
			HashMap<String, Object> district = districtList.get(i);
			for(int j = 0; j < curTreatmentList.size(); j++) {
				HashMap<String, Object> curTreat = curTreatmentList.get(j);
				if(district.get("H_NO").equals(curTreat.get("H_NO"))) {
					
					if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) < min)
						min = Integer.parseInt(curTreat.get("TR_PRICE").toString());
					if(Integer.parseInt(curTreat.get("TR_PRICE").toString()) > max)
						max = Integer.parseInt(curTreat.get("TR_PRICE").toString());
					
					districtPrice += Integer.parseInt(curTreat.get("TR_PRICE").toString());
					districtNum++;
				}
			}
		}

		session.setAttribute("districtMin", min);
		session.setAttribute("districtMax", max);
		
		cityPrice = (int)(cityPrice / cityNum);
		districtPrice = (int)(districtPrice / districtNum); // 금정구없어서 0임
		session.setAttribute("cityPrice", cityPrice);
		session.setAttribute("districtPrice", districtPrice);
		session.setAttribute("totalPrice", totalPrice);
		
		System.out.println("cityMin=" + session.getAttribute("cityMin"));
		System.out.println("cityMax=" + session.getAttribute("cityMax"));
		System.out.println("districtMin=" + session.getAttribute("districtMin"));
		System.out.println("districtMax=" + session.getAttribute("districtMax"));
		System.out.println("totalMin=" + session.getAttribute("totalMin"));
		System.out.println("totalMax=" + session.getAttribute("totalMax"));
		
		System.out.println("cityPrice=" + session.getAttribute("cityPrice"));
		System.out.println("districtPrice=" + session.getAttribute("districtPrice"));
		System.out.println("totalPrice=" + session.getAttribute("totalPrice"));
//		System.out.println(orderedList);
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
	public String treatSearchDetail(Model model, @RequestParam("Search-box") String content, HttpServletResponse response, HttpServletRequest request)
	{
		
		System.out.println(model.getAttribute("treatment"));
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		for(int i = 0; i < treatmentList.size(); i++) {
			HashMap<String, Object> treatment = treatmentList.get(i);
			if((treatment.get("TR_NAME")).equals(content)) {
				model.addAttribute("treatment", treatment);
			}
		}
		

		return "treatment/treatdetail";
		
	}
	
}