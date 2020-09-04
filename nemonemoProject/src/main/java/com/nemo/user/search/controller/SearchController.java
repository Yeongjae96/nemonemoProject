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
import com.nemo.user.search.service.SearchStoreService;
import com.nemo.user.search.service.SearchTopKeywordService;
import com.nemo.user.search.vo.UserBaseTopSearchedVO;
import com.nemo.user.search.vo.UserSearchStoreResVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchProductsService searchProductsService;
	@Autowired
	private SearchStoreService searchStoreService;
	@Autowired
	private SearchTopKeywordService searchTopKeywordService;
	
	
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
	
	@GetMapping("/shops")
	public ModelAndView searchStorePage(@RequestParam(value="q") String keyword) {
		System.err.println(keyword);
		ModelAndView mav = new ModelAndView("search/search_store");
		
		UserSearchStoreResVO vo = searchStoreService.searchStoreList(keyword);
		
		mav.addObject("vo", vo);
		
		return mav;
	}
	
	
	@GetMapping("/keyword")
	@ResponseBody
	public List<String> searchKeyword(@RequestParam String keyword) {
		if(keyword.trim().length() == 0) return null;
		if(keyword.substring(0, 1).equals("@")) {
			keyword = keyword.substring(1);
			System.err.println(keyword);
			return searchStoreService.searchStoreKeyword(keyword);
		} else {
			return searchProductsService.searchProductKeyword(keyword);
		}
	}
	
	@GetMapping("/toplist")
	@ResponseBody
	public List<UserBaseTopSearchedVO> getTopSearchedList() {
		return searchTopKeywordService.getSearchTopKeywordList();
	}
	
}
