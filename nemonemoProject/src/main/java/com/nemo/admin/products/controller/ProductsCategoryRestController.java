package com.nemo.admin.products.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nemo.admin.products.service.ProductsCategoryService;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

/**
 * @제목 : 상품 카테고리 JSON 컨트롤러
 * @패키지이름 : com.nemo.admin.products.controller
 * @파일이름 : ProductsCategoryRestController.java
 * @작성일 : 2020. 8. 9.
 * @이름 : Yeong
 * @프로그램설명 : 상품 카테고리에 대한 JSON 요청을 관리하는 컨트롤러이다.
 */
@RestController
@RequestMapping("/products/category")
public class ProductsCategoryRestController {

	@Autowired
	public ProductsCategoryService productsCategoryService;

	@GetMapping("/listJson")
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo) {
		return productsCategoryService.getCategoryList(vo);
	}

	@PostMapping("/newJson")
	public int insertCategoryJson(AdminBaseProductsCategoryVO vo) {
		return productsCategoryService.insertProductCategory(vo);
	}

	@GetMapping("/getCateJson")
	public AdminBaseProductsCategoryVO getCategoryJson(@RequestParam int productCateNo) {
		return productsCategoryService.getCategory(productCateNo);
	}

	@PostMapping("/updateJson") 
	public int updateCategoryJson(AdminBaseProductsCategoryVO vo) { 
		return productsCategoryService.updateProductCategory(vo); }

	@PostMapping("/deleteJson")
	public int deleteCategoryJson(@RequestParam int productsCateNo) {
		return productsCategoryService.deleteProductCategory(productsCateNo);
	}
	
	@PostMapping("/changeUseFl")
	public int changeUseFlagCategoryJson(AdminBaseProductsCategoryVO vo) {
		return productsCategoryService.changeUseFlagCategoryJson(vo);
	}
	
	
}
