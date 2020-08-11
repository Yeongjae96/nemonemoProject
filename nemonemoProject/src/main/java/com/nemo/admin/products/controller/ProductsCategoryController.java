package com.nemo.admin.products.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.products.service.ProductsCategoryService;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

@Controller
@RequestMapping("/products/category")
public class ProductsCategoryController {
	
	@Autowired
	private ProductsCategoryService productsCategoryService;
	
	@GetMapping("/list")
	public ModelAndView categoryListPage(AdminBaseProductsCategoryVO vo) {
		
		ModelAndView mav = new ModelAndView("products/category/products_category_list");
		List<AdminBaseProductsCategoryVO> list = productsCategoryService.getCategoryList(vo);
		mav.addObject("productCategory", list);
		return mav;
	}
	
	
}
