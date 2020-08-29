package com.nemo.user.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.common.paging.PageVO;
import com.nemo.user.search.products.service.SearchProductsService;
import com.nemo.user.search.products.vo.SearchProductsVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchProductsService searchProductsService;
	
	@GetMapping("/products")
	public ModelAndView searchProductsPage (
			@RequestParam("q") String keyword,
			@RequestParam(value = "order", required = false, defaultValue = "date") String order,
			@RequestParam(value = "categoryNo", required = false, defaultValue="-1") int categoryNo,
			PageVO pageVO
			) {
		
		ModelAndView mav = new ModelAndView("search/search_board");
		SearchProductsVO vo = searchProductsService.getSearchArticle(keyword, order, categoryNo, pageVO);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@GetMapping("/store")
	public ModelAndView searchStorePage() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	@GetMapping("/keyword")
	@ResponseBody
	public List<String> searchKeyword(@RequestParam String keyword) {
		return searchProductsService.searchProductKeyword(keyword);
	}
	
}
