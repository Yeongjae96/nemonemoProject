package com.nemo.user.pusrchases.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.purchases.vo.PurchasesVO;

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

	@RequestMapping(value = "/purchases", method = { RequestMethod.POST })
	public ModelAndView purchaseKaKaoAction(PurchasesVO vo, HttpServletRequest req) {
		// 암호화 진행
		System.out.println(vo.toString());

		ModelAndView mav = new ModelAndView();
		/*
		 * req.setAttribute("name", vo.getBuyerName()); req.setAttribute("email",
		 * vo.getBuyerEmail()); req.setAttribute("phone", vo.getBuyerPhone());
		 * req.setAttribute("address", vo.getBuyerAddress());
		 * req.setAttribute("totalPrice", vo.getPurchasePrice());
		 */

		
		mav.addObject("name", vo.getBuyerName());
		mav.addObject("email", vo.getBuyerEmail());
		mav.addObject("phone", vo.getBuyerPhone());
		mav.addObject("address", vo.getBuyerAddress());
		mav.addObject("totalPrice", vo.getPurchasePrice());

		mav.setViewName("redirect:/purchases/kakaoPay.do");
		return mav;

	}
}
