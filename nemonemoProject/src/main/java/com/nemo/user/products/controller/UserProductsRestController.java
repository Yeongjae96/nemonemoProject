package com.nemo.user.products.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nemo.user.products.service.UserProductsCategoryService;
import com.nemo.user.products.service.UserProductsCommentsService;
import com.nemo.user.products.service.UserProductsEditService;
import com.nemo.user.products.service.UserProductsFavoriteService;
import com.nemo.user.products.vo.ProductsCommentsVO;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsFavoriteVO;
import com.nemo.user.products.vo.UserGetProductVO;
import com.nemo.user.products.vo.UserNewProductsVO;

@RestController
@RequestMapping("/products")
public class UserProductsRestController {
	
	@Autowired
	private UserProductsCommentsService userProductsCommentsService;
	@Autowired
	private UserProductsCategoryService userProductsRestService;
	@Autowired
	private UserProductsFavoriteService userProductsFavoriteService;
	@Autowired
	private UserProductsEditService userProductsEditService;
	
	@GetMapping("/allCateList")
	public List<UserBaseProductsCategoryVO> getCategoryList() {
		return userProductsRestService.getAllCategoryList();
	}
	
	@PostMapping("/{productNo}/new")
	public @ResponseBody int newComment(@PathVariable("productNo") int productNo, ProductsCommentsVO vo) {
		return userProductsCommentsService.insertProductComment(vo);
	}
	
	@PostMapping("/{productNo}/delete")
	public @ResponseBody int deleteComment(ProductsCommentsVO vo) {
		return userProductsCommentsService.deleteProductComment(vo);
	}
	
	
	@PostMapping("/favorite/new")
	public @ResponseBody int newFavorite(UserBaseProductsFavoriteVO vo) {
		return userProductsFavoriteService.insertFavorite(vo);
	}
	@PostMapping("/favorite/delete")
	public @ResponseBody int deleteFavorite(UserBaseProductsFavoriteVO vo) {
		return userProductsFavoriteService.deleteFavorite(vo);
	}
	
	@PostMapping("/{productNo}/edit")
	@ResponseBody
	public int updateProduct(UserNewProductsVO vo) {
		return userProductsEditService.editProduct(vo);
	}
	
	
}
