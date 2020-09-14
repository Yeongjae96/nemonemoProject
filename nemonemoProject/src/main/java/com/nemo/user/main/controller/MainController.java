package com.nemo.user.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.main.service.GetPopularCateListService;
import com.nemo.user.main.service.GetPopularProductListService;
import com.nemo.user.main.service.GetRecommendProductListService;
import com.nemo.user.main.vo.PopularCateVO;
import com.nemo.user.main.vo.PopularProductVO;
import com.nemo.user.main.vo.RecommendProductVO;


/**
 * @제목 : 메인 페이지 컨트롤러
 * @패키지이름 : com.nemo.user.main.controller
 * @파일이름 :MainController.java
 * @작성일 : Sep 9, 2020
 * @이름 : Hyein
 * @프로그램설명 : 메인페이지 추천 상품 및 카테고리별 인기상품 리스트 컨트롤러
 */

@Controller
public class MainController {
	
	@Autowired private GetRecommendProductListService getRecommendProductListService;
	@Autowired private GetPopularCateListService getPopularCateListService;
	@Autowired private GetPopularProductListService getPopularProductListService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		List<RecommendProductVO> recommendProductList = getRecommendProductListService.getRecommendProductList();
		List<PopularCateVO> popularCateList = getPopularCateListService.getPopularCateList();
		List<PopularProductVO> popularProductList = getPopularProductListService.getPopularProductList();
		
		ModelAndView mav = new ModelAndView("main");
		
		mav.addObject("recommendProductList", recommendProductList);
		mav.addObject("popularCateList", popularCateList);
		mav.addObject("popularProductList", popularProductList);
		
		return mav;
	}
}
