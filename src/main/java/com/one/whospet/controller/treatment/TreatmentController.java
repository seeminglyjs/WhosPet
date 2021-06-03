package com.one.whospet.controller.treatment;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		model.addAttribute("treatmentList", treatmentList);
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
		model.addAttribute("treatmentList", treatmentList);
		model.addAttribute("VList", VList);
		model.addAttribute("SList", SList);
		model.addAttribute("CList", CList);
		return "treatment/treatmain";
	}
	
	
	
	@RequestMapping(value = "/treatment/treatdetail", method = RequestMethod.GET)
	public String treatdetailView(Model model, @RequestParam("no") int no) {
		
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		
		for(int i = 0; i < treatmentList.size(); i++) {
			HashMap<String, Object> treatment = treatmentList.get(i);
			if(((BigDecimal)treatment.get("TR_NO")).intValue() == no) {
				model.addAttribute("treatment", treatment);
			}
			
		}
		return "treatment/treatdetail";
	}
	
	
	@RequestMapping(value = "/treatment/treatdetail", method = RequestMethod.POST)
	public String treatSearch(@RequestParam HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request)
	{
		System.out.println(response);
		return "treatment/treatdetail";
	}
	
	
	@RequestMapping(value = "/treatment/treatlist", method = RequestMethod.POST)
	public String treatlist(@RequestParam HashMap<String, String> map, HttpServletResponse response, HttpServletRequest request)
	{
		List<HashMap<String, Object>> hospitalList = hospitalService.allHospital();
		List<HashMap<String, Object>> orderedList = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < hospitalList.size(); i++) {
			HashMap<String, Object> hospital = hospitalList.get(i);
			if(((String)hospital.get("H_ROAD_ADDRESS")).contains(map.get("region"))){
				orderedList.add(hospital);
			}
		}
		
		System.out.println(map.get("region"));
		return "treatment/treatdetail";
	}
	
	
	
	
	
}