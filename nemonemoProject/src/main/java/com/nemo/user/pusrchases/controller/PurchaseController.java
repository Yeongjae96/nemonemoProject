package com.nemo.user.pusrchases.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nemo.user.purchases.vo.PurchasesVO;
import com.nemo.user.pusrchases.service.PurchaseService;

@Controller
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

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

	@GetMapping("/tab/purchases")
	public ModelAndView tabPurchasesPage(Model model, @RequestParam("user") int buyerNo) {
		ModelAndView mav = new ModelAndView("tab/buy");

		PurchasesVO vo = new PurchasesVO();
		vo.setBuyerNo(buyerNo);

		List<PurchasesVO> buylist = purchaseService.buyList(vo);
		model.addAttribute("boardList", buylist);
		return mav;
	}

	@GetMapping("/tab/orders")
	public ModelAndView tabOrderPage(Model model, @RequestParam("user") int productSeller) {
		ModelAndView mav = new ModelAndView("tab/sell");

		PurchasesVO vo = new PurchasesVO();
		vo.setProductSeller(productSeller);

		List<PurchasesVO> sellList = purchaseService.sellList(vo);
		model.addAttribute("boardList", sellList);
		return mav;
	}

	@RequestMapping(value = "/purchases", method = { RequestMethod.POST })
	public ModelAndView purchaseKaKaoAction(PurchasesVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.toString());

		List<PurchasesVO> getlist = purchaseService.getSelectList(vo);
		
		if (getlist.isEmpty()) {
			if (vo.getPurchaseWay().equals("kakao")) {

				purchaseService.insertPay(vo);

				mav.addObject("totalPrice", vo.getPurchasePrice());
				mav.addObject("productName", vo.getProductName());

				mav.setViewName("redirect:/purchases/pay.do");
			} else if (vo.getPurchaseWay().contentEquals("account")) {

				purchaseService.insertPay(vo);

				// 카카오 거래는 상관없지만 계좌거래시 입금할 것을 모달로 띄우기위해 메세지 전달하여 모달을 띄우는 용도
				rttr.addFlashAttribute("msg", "account");
				mav.addObject("totalPrice", vo.getPurchasePrice());
				mav.addObject("productName", vo.getProductName());

				mav.setViewName("redirect:/purchases/pay.do");
			}
		} else {
			for(int i=0; i<getlist.size(); i++) {
				if(getlist.get(i).getPurchasePaySt().equals("N")) {
					rttr.addFlashAttribute("msg", "buying");

					mav.addObject("totalPrice", vo.getPurchasePrice());
					mav.addObject("productName", vo.getProductName());
					mav.setViewName("redirect:/purchases/pay.do");
				} else if (getlist.get(i).getPurchasePaySt().equals("Y")) {
					rttr.addFlashAttribute("msg", "success");

					mav.addObject("totalPrice", vo.getPurchasePrice());
					mav.addObject("productName", vo.getProductName());
					mav.setViewName("redirect:/purchases/pay.do");
				} else {
					if (vo.getPurchaseWay().equals("kakao")) {

						purchaseService.insertPay(vo);

						mav.addObject("totalPrice", vo.getPurchasePrice());
						mav.addObject("productName", vo.getProductName());

						mav.setViewName("redirect:/purchases/pay.do");
					} else if (vo.getPurchaseWay().contentEquals("account")) {

						purchaseService.insertPay(vo);

						// 카카오 거래는 상관없지만 계좌거래시 입금할 것을 모달로 띄우기위해 메세지 전달하여 모달을 띄우는 용도
						rttr.addFlashAttribute("msg", "account");
						mav.addObject("totalPrice", vo.getPurchasePrice());
						mav.addObject("productName", vo.getProductName());

						mav.setViewName("redirect:/purchases/pay.do");
					}
				}
			}
		}

		return mav;
	}

	@RequestMapping(value = "/tab/updateSt", method = { RequestMethod.POST })
	public ModelAndView updatePurchaseStAction(String userNo,PurchasesVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.toString());
		String user = userNo;
		purchaseService.upPaySt(vo);
		purchaseService.upProductSt(vo);
		rttr.addFlashAttribute("msg", "success");
		mav.setViewName("redirect:/tab/purchases.do?user="+user);
		return mav;
	}
	
	@RequestMapping(value = "/tab/cancelSt", method = { RequestMethod.POST })
	public ModelAndView CancelPurchaseStAction(String userNo,PurchasesVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.toString());
		String user = userNo;
		purchaseService.CancelPaySt(vo);
		rttr.addFlashAttribute("msg", "cancel");
		mav.setViewName("redirect:/tab/purchases.do?user="+user);
		return mav;
	}

}
