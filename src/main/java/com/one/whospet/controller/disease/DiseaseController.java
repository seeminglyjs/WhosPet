package com.one.whospet.controller.disease;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.whospet.dto.Disease;
import com.one.whospet.service.disease.face.DiseaseService;
import com.one.whospet.service.treatment.face.TreatmentService;

@Controller
public class DiseaseController {

	@Autowired
	private DiseaseService diseaseService;

	@RequestMapping(value = "/disease/diseasemain", method = RequestMethod.GET)
	public String diseaseMain(Model model) {
		
	List<Disease> eyeList = new ArrayList<Disease>();
	List<Disease> behaviorList = new ArrayList<Disease>();
	List<Disease> noseList = new ArrayList<Disease>();
	List<Disease> foodList = new ArrayList<Disease>();
	List<Disease> airList = new ArrayList<Disease>();
	List<Disease> urineList = new ArrayList<Disease>();
	
	eyeList = diseaseService.getEyeList();
	
	behaviorList = diseaseService.getBehaviorList();
	
	noseList = diseaseService.getNoseList();
	
	foodList = diseaseService.getFoodList();
	
	airList = diseaseService.getAirList();
	
	urineList = diseaseService.getUrineList();
	
	model.addAttribute("eyeList", eyeList);
	
	model.addAttribute("behaviorList", behaviorList);
	
	model.addAttribute("noseList", noseList);
	
	model.addAttribute("foodList", foodList);
	
	model.addAttribute("airList", airList);
	
	model.addAttribute("urineList", urineList);
	
	return "disease/diseasemain";
	

}	
	
	@RequestMapping(value = "/disease/diseasedetail")
	public String diseaseDetail(@RequestParam("dQNo") int dQNo, HttpServletRequest request, Model model ) {
		
		System.out.println("/disease/diseasedetail " + dQNo);
				
		List<Disease> viewList = new ArrayList<Disease>();
		
		viewList = diseaseService.getViewList(dQNo);
		
		model.addAttribute("viewList", viewList);
		
		return "disease/diseasedetail";
	}
	
	@RequestMapping(value = "/disease/diseaseresult")
	public String diseaseResult(@RequestParam("dNo") int dNo, HttpServletRequest request, Model model) {
		
		
		
		List<Disease> resultList = new ArrayList<Disease>();
		
		resultList = diseaseService.getResultList(dNo);
		
		model.addAttribute("resultList", resultList);
		
		return "disease/diseaseresult";
		
	}
	
}



