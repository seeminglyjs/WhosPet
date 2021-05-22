package com.one.whospet.controller.hospital;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HospitalController {
	
	@RequestMapping(value = "/hospital/list")
	public void list() {}
	
}
