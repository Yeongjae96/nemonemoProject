package com.nemo.user.pusrchases.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	
	@GetMapping("/purchases")
	public ModelAndView purchasesPage() {
		ModelAndView mav = new ModelAndView("purchases/purchase");
		return mav;
	}
	
	@GetMapping("/purchases/kakaoPay")
	public ModelAndView KakaoPayPage() {
		ModelAndView mav = new ModelAndView("purchases/kakaoPay");
		return mav;
	}
}
