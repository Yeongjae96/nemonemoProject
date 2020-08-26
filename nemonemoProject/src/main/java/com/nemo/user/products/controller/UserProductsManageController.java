package com.nemo.user.products.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.common.paging.PageVO;
import com.nemo.user.products.service.UserProductsManageService;
import com.nemo.user.products.vo.UserProductsManageResVO;

@Controller
@RequestMapping("/products")
public class UserProductsManageController {
	
	@Autowired
	private UserProductsManageService userProductsManageService;
	
	@ModelAttribute("productStList")
	public Map<String, String> getStatusList() {
		Map<String,String> result = new LinkedHashMap<String, String>();
		result.put("S", "판매중");
		result.put("R", "예약중");
		result.put("D", "삭제");
		result.put("F", "판매완료");
		return result;
	}
	@ModelAttribute("allStList")
	public Map<String, String> getAllStList() {
		Map<String,String> result = new LinkedHashMap<String, String>();
		result.put("all", "전체");
		result.put("selling", "판매중");
		result.put("reserved", "예약중");
		result.put("soldout", "판매완료");
		return result;
	}
	@ModelAttribute("cntList")
	public List<String> getCntList() {
		return getList("10","20","50","100");
	}
	
	
	@GetMapping("/manage")
	public ModelAndView managePage(
			@RequestParam(value = "pageNo", defaultValue="1")int pageNo,
			@RequestParam(value = "pageSize", defaultValue="10")int pageSize,
			@RequestParam(value = "q", defaultValue="", required=false)String keyword,
			@RequestParam(value = "status", defaultValue="all")String status
			) {
		ModelAndView mav = new ModelAndView("products/products_manage");
		Map<String, Object> manageParamMap = new HashMap<>();
		PageVO pageVO = new PageVO();
		pageVO.setPageNo(pageNo);
		pageVO.setPageSize(pageSize);
		manageParamMap.put("pageVO", pageVO);
		manageParamMap.put("keyword", keyword);
		manageParamMap.put("status", status);
		
		UserProductsManageResVO resVO = userProductsManageService.getAllUserProducts(manageParamMap);
		mav.addObject("vo", resVO);
		return mav;
	}
	
	
	
	// 매개변수로 ArrayList 반환
	private List<String> getList(String... strs) {
		List<String> result = new ArrayList<>(strs.length);
		for(String str : strs) {
			result.add(str);
		}
		return result;
	}
	
	
}
