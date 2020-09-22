package com.nemo.user.products.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.products.service.GetProductService;
import com.nemo.user.products.vo.UserBaseProductsVO;
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
	
	@RequestMapping(value = "/purchases", method = { RequestMethod.POST })
	public ModelAndView purchaseAction(UserBaseProductsVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/purchases.do");

		mav.addObject("productNo", vo.getProductNo());
		mav.addObject("productSeller", vo.getProductSeller());
		mav.addObject("productName", vo.getProductName());
		mav.addObject("productPrice", vo.getProductPrice());
		if(vo.getProductFreeShippingSt().equals("N")) {
			mav.addObject("productFreeShippingSt", "0");
		} 
		else if (vo.getProductFreeShippingSt().equals("Y")) {
			mav.addObject("productFreeShippingSt", "3000");
		}
		
		mav.setViewName("redirect:/purchases.do");
		return mav;


	}
}	
