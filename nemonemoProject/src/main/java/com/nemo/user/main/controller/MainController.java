package com.nemo.user.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.main.service.GetPopularCateListService;
import com.nemo.user.main.service.GetPopularProductListService;
import com.nemo.user.main.service.GetRecommendProductList2Service;
import com.nemo.user.main.service.GetRecommendProductList3Service;
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
	@Autowired private GetRecommendProductList2Service getRecommendProductList2Service;
	@Autowired private GetRecommendProductList3Service getRecommendProductList3Service;
	@Autowired private GetPopularCateListService getPopularCateListService;
	@Autowired private GetPopularProductListService getPopularProductListService;
	
	@GetMapping(value= {"/index"})
	public ModelAndView index() {
		List<RecommendProductVO> recommendProductList = getRecommendProductListService.getRecommendProductList();
		List<PopularCateVO> popularCateList = getPopularCateListService.getPopularCateList();
		List<PopularProductVO> popularProductList = getPopularProductListService.getPopularProductList();
		List<RecommendProductVO> recommendProductList2 = getRecommendProductList2Service.getRecommendProductList2();
		List<RecommendProductVO> recommendProductList3 = getRecommendProductList3Service.getRecommendProductList3();
		
		ModelAndView mav = new ModelAndView("main");
		
		System.out.println(recommendProductList);
		
		mav.addObject("recommendProductList", recommendProductList);
		mav.addObject("popularCateList", popularCateList);
		mav.addObject("popularProductList", popularProductList);
		mav.addObject("recommendProductList2", recommendProductList2);
		mav.addObject("recommendProductList3", recommendProductList3);
		
		
		return mav;
	}
}
