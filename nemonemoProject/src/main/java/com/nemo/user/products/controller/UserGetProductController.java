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
		System.out.println(vo.toString());
		mav.setViewName("redirect:/purchases.do");
		return mav;

	}
}	
