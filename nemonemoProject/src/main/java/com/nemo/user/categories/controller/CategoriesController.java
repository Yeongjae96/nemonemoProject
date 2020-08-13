package com.nemo.user.categories.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.categories.service.CategoryService;
import com.nemo.user.categories.service.UserCategoryProductVO;

@Controller
@RequestMapping("/categories")
public class CategoriesController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public ModelAndView goHome() {
		return new ModelAndView("redirect:/");
	}
	
	
	@GetMapping("/{productCateNo}")
	public ModelAndView categoryList(@PathVariable int productCateNo) {
		
		UserCategoryProductVO vo = categoryService.getCategoryProducts(productCateNo);
		System.out.println(vo);
		ModelAndView mav = new ModelAndView("categories/categories_board");
		mav.addObject("vo", vo);
		return mav;
	}
	
}
