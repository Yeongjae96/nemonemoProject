package com.nemo.user.products.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.products.service.UserProductsEditService;
import com.nemo.user.products.vo.UserProductsEditVO;

@Controller
@RequestMapping("/products")
public class UserProductsEditController {
	
	@Autowired
	private UserProductsEditService userProductsEditService;
	
	@GetMapping("/{productNo}/edit")
	public ModelAndView editPage(@PathVariable("productNo") int productNo) {
		ModelAndView mav = new ModelAndView();
		
		UserProductsEditVO vo = userProductsEditService.getEditVO(productNo);
		if(vo == null) {
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("products/products_edit");
			mav.addObject("vo", vo);
		}
		
		return mav;
	}
	
	
}
