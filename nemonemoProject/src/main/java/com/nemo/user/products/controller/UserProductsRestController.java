package com.nemo.user.products.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nemo.user.products.service.UserProductsRestService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

@RestController
@RequestMapping("/products")
public class UserProductsRestController {
	
	@Autowired
	private UserProductsRestService userProductsRestService;
	
	
	@GetMapping("/allCateList")
	public List<UserBaseProductsCategoryVO> getCategoryList() {
		return userProductsRestService.getAllCategoryList();
	}
	
	
	
}
