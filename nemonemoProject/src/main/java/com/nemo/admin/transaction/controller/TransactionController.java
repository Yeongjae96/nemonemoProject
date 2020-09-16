package com.nemo.admin.transaction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.transaction.service.TransactionService;
import com.nemo.user.purchases.vo.PurchasesVO;

/**
 * @제목 : 관리자 주문페이지
 * @패키지이름 : com.nemo.admin.transaction.controller
 * @파일이름 : TransactionController.java
 * @작성일 : 2020. 9. 15.
 * @이름 : 김동균
 * @프로그램설명 : 관리자 주문페이지 컨트롤러
 */

@Controller
public class TransactionController {
	
	@Autowired
	private TransactionService transactionService;
	
	@GetMapping("/transaction/orderList")
	public ModelAndView orderListPage(Model model) {
		ModelAndView mav = new ModelAndView("transaction/order_list");
		List<PurchasesVO> allList = transactionService.allList();
		
		model.addAttribute("boardList", allList);
		
		return mav;
	}

	@GetMapping("/transaction/paymentList")
	public ModelAndView paymentListPage(Model model) {
		ModelAndView mav = new ModelAndView("transaction/payment_list");
		List<PurchasesVO> allList = transactionService.allList();
		
		model.addAttribute("boardList", allList);
		
		return mav;
	}
	
}
