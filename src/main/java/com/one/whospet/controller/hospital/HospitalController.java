package com.one.whospet.controller.hospital;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.whospet.dto.Hospital;
import com.one.whospet.service.hospital.face.HospitalService;
import com.one.whospet.util.HospitalPaging;

@Controller
public class HospitalController {
	
	@Autowired HospitalService hospitalService;
	
	@RequestMapping(value = "/hospital/list")
	public void list(Model model, @RequestParam(defaultValue = "1", required = true) int curPage) {
		
		HospitalPaging paging = hospitalService.getPaging(curPage);
				
		//병원 전체 리스트를 가져온다
		List<Map<String, Object>> list = hospitalService.getHospital(paging);
		JSONArray jArray = new JSONArray();
		
		for(int i=0; i<list.size(); i++) {
			
			JSONObject data = new JSONObject();
			data.put("name", list.get(i).get("H_NAME"));
			data.put("address", list.get(i).get("H_ROAD_ADDRESS"));
			jArray.add(i, data);
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("arraylist", jArray);
		
		System.out.println(jArray);
		
		
		
	}
	
	@RequestMapping(value = "/hospital/search", method = RequestMethod.GET)
	public void search(@RequestParam HashMap<String, String> map, Model model) {
		
		List<Hospital> list = hospitalService.search(map);
		
		HashMap<String, Object> info = hospitalService.getSearchinfo(map);
		
		
		model.addAttribute("list", list);
		model.addAttribute("info", info);
		
		
	}	
	
}
