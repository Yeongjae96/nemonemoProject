package com.nemo.user.products.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.products.service.GetProductService;
import com.nemo.user.products.vo.UserGetProductVO;

@Controller
@RequestMapping("/products")
public class UserGetProductController {
	
	@Autowired
	private GetProductService getProductService;
	
	@GetMapping("/{productNo}")
	public ModelAndView productPage(@PathVariable int productNo) {
		ModelAndView mav = new ModelAndView("products/products_article");
		UserGetProductVO vo = getProductService.getProduct(productNo);
		mav.addObject("vo", vo);
		return mav;
	}
	
}	
