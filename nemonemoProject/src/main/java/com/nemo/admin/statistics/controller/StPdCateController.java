package com.nemo.admin.statistics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.statistics.service.StPdCategoryService;

@Controller
@RequestMapping("/statistics/category")
public class StPdCateController {
	
	@Autowired
	private StPdCategoryService stPdCateService;
	
	@GetMapping("/list")
	public ModelAndView 카테고리별페이지() {
		ModelAndView mav = new ModelAndView("statistics/stat_sales_category");
		mav.addObject("largeCategory", stPdCateService.getLargeCategories());
		return mav;
	}
}
