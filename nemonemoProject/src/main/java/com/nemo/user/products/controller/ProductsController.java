package com.nemo.user.products.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/products")
public class ProductsController{
	
	public ProductsController() {
		System.out.println("ProductsController 생성!");
	}
	
	@RequestMapping("/new")
	public ModelAndView getBoardList() {
		System.out.println("컨트롤러 ");
		ModelAndView mav = new ModelAndView("products/products_new");
		return mav;
	}
	

}
