package com.nemo.user.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.store.service.GetStoreProductListService;
import com.nemo.user.store.service.GetStoreService;
import com.nemo.user.store.service.UpdateStoreService;
import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreVO;


/**
 * @제목 : 상점 관리 컨트롤러
 * @패키지이름 : com.nemo.user.store.controller
 * @파일이름 :StoreController.java
 * @작성일 : Aug 14, 2020
 * @이름 : Hyein
 * @프로그램설명 : 회원별 상점의 메뉴 경로를 지정하는 컨트롤러
 */

@Controller
@RequestMapping("/shop/{storeNo}")
public class StoreController {
	
	@Autowired private GetStoreService getStoreService;
	@Autowired private GetStoreProductListService getStoreProductListService;
	@Autowired private UpdateStoreService updateStoreService;
	
	@RequestMapping(value = "/products", method= {RequestMethod.GET})
	public ModelAndView GetStoreInfo(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/products/products");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		List<StoreProductVO> storeProductVO = getStoreProductListService.getStoreProductList(storeNo);
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeProductVO", storeProductVO);
		
		return mav;
	}

	@RequestMapping(value = "/info", method= {RequestMethod.GET})
	public ModelAndView StoreInfoEdit(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/storeinfo");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		mav.addObject("storeVO", storeVO);
		
		return mav;
	}
	
	@PostMapping("/updateStore")
	public ModelAndView UpdateStoreAction(StoreVO vo) {
		 updateStoreService.updateStore(vo);
		 return new ModelAndView("redirect:/shop/{storeNo}/products.do");
	}
	
}