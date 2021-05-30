package com.one.whospet.controller.treatment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.whospet.service.treatment.face.TreatmentService;

@Controller
public class TreatmentController {

	@Autowired
	private TreatmentService treatmentService;
	
	@RequestMapping(value = "/treatmain", method = RequestMethod.GET)
	public String treatmainView(Model model) {
		List<HashMap<String, Object>> treatmentList = treatmentService.selectAllTreatment();
		model.addAttribute("treatmentList", treatmentList);
		model.addAttribute("numOftreat", treatmentList.size());
		
		
		List<HashMap<String, Object>> VList = new ArrayList<HashMap<String, Object>>();
		List<HashMap<String, Object>> SList = new ArrayList<HashMap<String, Object>>();
		List<HashMap<String, Object>> CList = new ArrayList<HashMap<String, Object>>();
		
		for(int i=0; i<treatmentList.size(); ++i) {
			if(treatmentList.get(i).get("TR_TYPE").equals("V")) 
			{
				VList.add(treatmentList.get(i));
			}
			else if(treatmentList.get(i).get("TR_TYPE").equals("S")) 
			{
				SList.add(treatmentList.get(i));
			}
			else if(treatmentList.get(i).get("TR_TYPE").equals("C")) 
			{
				CList.add(treatmentList.get(i));
			}
		}
		model.addAttribute("treatmentList", treatmentList);
		model.addAttribute("VList", VList);
		model.addAttribute("SList", SList);
		model.addAttribute("CList", CList);

		return "treatment/treatmain";
	}
}
