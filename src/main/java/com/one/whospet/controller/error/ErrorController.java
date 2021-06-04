package com.one.whospet.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping(value = "/error/404errorPage")
	public void error404() {}

	@RequestMapping(value = "/error/405errorPage")
	public void error405() {}
	
	@RequestMapping(value = "/error/500errorPage")
	public void error500() {}


}
