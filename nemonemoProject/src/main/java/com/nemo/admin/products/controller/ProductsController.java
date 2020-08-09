package com.nemo.admin.products.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@GetMapping("/list")
	public ModelAndView listPage() {
		ModelAndView mav = new ModelAndView("products/product_list");
		return mav;
	}
	
	
}
