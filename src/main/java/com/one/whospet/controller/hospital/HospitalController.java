package com.one.whospet.controller.hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.whospet.dto.Booking;
import com.one.whospet.dto.Hospital;
import com.one.whospet.dto.Review;
import com.one.whospet.service.hospital.face.HospitalService;
import com.one.whospet.util.AdminHospitalPaging;
import com.one.whospet.util.HospitalPaging;

@Controller
public class HospitalController {
	
	private static final Logger logger = LoggerFactory.getLogger(HospitalController.class);
	@Autowired HospitalService hospitalService;
	
	@RequestMapping(value = "/hospital/list")
	public void list(Model model, @RequestParam(defaultValue = "1", required = true) int curPage) {
		
		HospitalPaging paging = hospitalService.getPaging(curPage);
				
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
			
	}
	
	@RequestMapping(value = "/hospital/search", method = RequestMethod.GET)
	public void search(@RequestParam HashMap<String, Object> map, Model model,@RequestParam(defaultValue = "1") int curPage) {

		//페이징생성
		int totalCount = hospitalService.getTotalCount(map);
		HospitalPaging paging = new HospitalPaging(totalCount, curPage);
		map.put("paging", paging);
		
		
		List<HashMap<String, Object>> list = hospitalService.search(map);
		
		JSONArray jArray = new JSONArray();
		for(int i=0; i<list.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("name", list.get(i).get("H_NAME") );
			data.put("address", list.get(i).get("H_ROAD_ADDRESS"));
			jArray.add(data);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("info", map);
		model.addAttribute("arraylist", jArray);
		
	}	
	
	@RequestMapping(value = "/hospital/view")
	public void view(int hNo, Model model) {

		Hospital info = hospitalService.getView(hNo);
		List<HashMap<String, Object>> review = hospitalService.getReview(hNo);
		
		model.addAttribute("info", info);
		model.addAttribute("review", review);
	}
	
	@RequestMapping(value = "/hospital/book", method = RequestMethod.POST)
	public void book(@RequestParam HashMap<String, Object> map, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		int res = hospitalService.book(map);
		if(res==1) {
			out.println("<script>alert('예약에 성공하였습니다. '); location.href='/mypage/booking' </script>");
		}
		out.println("<script>alert('예약에 실패하였습니다. 관리자에게 문의해주세요. '); location.href='history.back()'; </script>");
		
	}
	
	@RequestMapping(value = "/hospital/reviewProc")
	public @ResponseBody int reviewProc(@RequestParam HashMap<String, Object> map) {
		
		int res = hospitalService.addReview(map);		
		return res;
	}
	
	@RequestMapping(value = "/hospital/register", method=RequestMethod.GET)
	public void register() {}
	
	@RequestMapping(value = "/hospital/register", method = RequestMethod.POST)
	public String registerProc(Hospital hospital) {
		
		hospitalService.registerHospital(hospital);
		return "redirect:/hospital/registerComplete?hNo="+hospital.gethNo();
	}
	
	@RequestMapping( value = "/hospital/registerComplete")
	public void registerComplete(int hNo, Model model) {
		
		Hospital hospital = hospitalService.getView(hNo);
		model.addAttribute("info", hospital);
		
	}
	
	@RequestMapping(value = "/admin/hospitalList")
	public void adminHospital(Model model, @RequestParam(defaultValue = "1", required = true) int curPage) {
		
		AdminHospitalPaging paging = hospitalService.getAdminPaging(curPage);
		List<Map<String, Object>> list = hospitalService.getHospital(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping(value = "/admin/hospitalApprove")
	public String adminHospitalApprove(int[] hNoArr) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("hNoArr", hNoArr);
		
		int res = hospitalService.appoveHospital(map);
		if(res>0) {
			return "redirect:/admin/hospitalList";
		}
		return null;
	}
	
	@RequestMapping(value = "/admin/hospitalReject")
	public String adminHospitalReject(int[] hNoArr) {
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hNoArr", hNoArr);
		
		int res = hospitalService.rejectHospital(map);
		if(res>0) {
			return "redirect:/admin/hospitalList";
		}
		return null;
	}
	
}
