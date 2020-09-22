package com.nemo.admin.products.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.products.service.AdminProductsService;
import com.nemo.admin.products.vo.AdminProductResponseVO;

@Controller
@RequestMapping("/products")
public class ProductsController {
	
	@Autowired AdminProductsService productsService;
	
	/* 상품 리스트 */
	@GetMapping("/list")
	public ModelAndView listPage(@RequestParam(required = false, defaultValue = "S") String disp) {
		ModelAndView mav = new ModelAndView("products/product_list");
		List<AdminProductResponseVO> productList = productsService.getProductList(disp);
		mav.addObject("productList", productList);
		return mav;
	}
	
	@PostMapping("/flagJson")
	@ResponseBody
	public int displayFlagAction(@RequestParam Map<String, Object> dispFlagParamMap) {
		return productsService.displayProductFlag(dispFlagParamMap);
	}
	
	
	
	
}
