package com.one.whospet.controller.point;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.whospet.dto.Point;
import com.one.whospet.service.mypage.face.MypageService;
import com.one.whospet.service.point.face.PointService;

@Controller
public class PointController {

		//로거 객체
		private static final Logger logger = LoggerFactory.getLogger(PointController.class);
		//로그인 서비스 객체
		@Autowired
		private PointService pointService;

		
		@RequestMapping(value = "/admin/pointManage", method=RequestMethod.GET)
		public void main() {}
		
		//포인트 리스트
		@RequestMapping(value = "/admin/pointList", method=RequestMethod.POST)
		public void point(@RequestBody Map<String, Object> param, Model model) {
		 logger.info("포인트" + param.toString());
		 int uNo = Integer.parseInt((String)param.get("uNo"));
//		 int poPlus = Integer.parseInt((String)param.get("poPlus"));
		 
		 List<Point> pointlist = pointService.getPointByUno(uNo);
		 for( int i=0; i<pointlist.size(); i++) {
				logger.info("포인트 이력" + pointlist.get(i).toString());
				}
			
			//현재포인트(지금까지의 유저 총합포인트) 구하기
			Point curpoint = pointService.getCurpointByUno(uNo);
			
			//모델값 전달
			model.addAttribute("uNo", uNo);
			model.addAttribute("pointlist", pointlist);
			model.addAttribute("curpoint", curpoint);
		}
		
		//포인트 부여하기
		@RequestMapping(value = "/admin/pointAdd", method=RequestMethod.POST)
		public void pointAdd(@RequestBody Map<String, Object> param, Model model, Writer out) {
		 logger.info("포인트" + param.toString());
		 int uNo = Integer.parseInt((String)param.get("uNo"));
		 int poPlus = Integer.parseInt((String)param.get("poPlus"));
		 String poPlusY = (String) param.get("poPlusY");
		 HashMap<String, Object> map = new HashMap<String,Object>();
		 map.put("uNo", uNo);
		 map.put("poPlus", poPlus);
		 map.put("poPlusY", poPlusY);
		 pointService.addPoint(map);
		 pointService.addSum(map);
		 
		 try {
			out.write("{\"result\":true}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//			return "redirect: /admin/pointManage";
		}


}
