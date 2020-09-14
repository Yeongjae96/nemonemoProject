package com.nemo.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("main");

		return mav;
	}
}