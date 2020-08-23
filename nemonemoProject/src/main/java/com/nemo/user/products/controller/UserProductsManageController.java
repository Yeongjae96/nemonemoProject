package com.nemo.user.products.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/manage")
	public ModelAndView managePage(
			@RequestParam(value = "pageNo", defaultValue="1")int pageNo,
			@RequestParam(value = "pageSize", defaultValue="10")int pageSize,
			@RequestParam(value = "q", defaultValue="", required=false)String keyword,
			@RequestParam(value = "status", defaultValue="A")String status
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
	
}
