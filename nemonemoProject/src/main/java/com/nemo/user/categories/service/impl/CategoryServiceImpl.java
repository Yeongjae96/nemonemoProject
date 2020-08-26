package com.nemo.user.categories.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.constrants.DirectoryName;
import com.nemo.common.util.FileUtil;
import com.nemo.user.categories.service.CategoryService;
import com.nemo.user.categories.service.UserCategoryProductVO;
import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private ProductsImageMapper imageMapper;
	@Autowired
	private ProductsMapper productMapper;
	@Autowired
	private UserProductsCategoryMapper categoryMapper;
	
	@Override
	public UserCategoryProductVO getCategoryProducts(int productCategoryNo) {
		
		// 1. 상품 카테고리 리스트
		List<UserBaseProductsCategoryVO> categoryList = categoryMapper.getAllCategoryList();
		
		// 2. 상품 리스트
//		List<UserBaseProductsVO> productList = productMapper;
		
		
		// 3. 상품 이미지 리스트
		
		// 4. 
		
		UserCategoryProductVO categoryProductVO = new UserCategoryProductVO();
		
		return null;
	}

}
