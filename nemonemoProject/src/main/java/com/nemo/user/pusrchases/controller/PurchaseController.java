package com.nemo.user.pusrchases.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nemo.user.purchases.vo.PurchasesVO;

@Controller
public class PurchaseController {

	@GetMapping("/purchases")
	public ModelAndView purchasesPage() {
		ModelAndView mav = new ModelAndView("purchases/purchase");
		return mav;
	}

	@GetMapping("/purchases/pay")
	public ModelAndView KakaoPayPage() {
		ModelAndView mav = new ModelAndView("purchases/pay");
		return mav;
	}

	@RequestMapping(value = "/purchases", method = { RequestMethod.POST })
	public ModelAndView purchaseKaKaoAction(PurchasesVO vo, HttpServletRequest req,RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.toString());
		
		if(vo.getPurchaseWay().equals("kakao")) {
			mav.addObject("totalPrice", vo.getPurchasePrice());
			mav.addObject("productName", vo.getProductName());

			mav.setViewName("redirect:/purchases/pay.do");
		} else if (vo.getPurchaseWay().contentEquals("account")) {
			rttr.addFlashAttribute("msg", "account");
			mav.addObject("totalPrice", vo.getPurchasePrice());
			mav.addObject("productName", vo.getProductName());

			mav.setViewName("redirect:/purchases/pay.do");
		}

		return mav;
	}
}
