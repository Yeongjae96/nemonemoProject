package com.nemo.user.categories.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.categories.service.CategoryService;
import com.nemo.user.categories.service.UserCategoryProductVO;
import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private ProductsImageMapper imageMapper;
	@Autowired
	private ProductsMapper productMapper;
	@Autowired
	private UserProductsCategoryMapper categoryMapper;
	
	@Override
	
	public UserCategoryProductVO getCategoryProducts(int productCateNo) {
		
		// 0. 리턴값
		UserCategoryProductVO resultVO = new UserCategoryProductVO();
		
		// 1. 상품 카테고리 리스트
		List<UserBaseProductsCategoryVO> productCategoryList = categoryMapper.getAllCategoryList();
		resultVO.setProductCategoryList(productCategoryList);
		
		// 2. 상품 리스트
		Map<String, Object> map = new HashMap<>();
		
		String productCategoryType = categoryMapper.searchTypeSeq(productCateNo); // 1. 시퀀스로 타입 검색
		map.put("productCateType", productCategoryType);
		map.put("productCateNo", productCateNo);
		
		List<Integer> cateSeqList = categoryMapper.selectChildrenCateNums(map); // 2. 시퀀스와 타입으로 해당 하위 시퀀스리스트 검색
		List<UserBaseProductsVO> productList = productMapper.selectCategoryProducts(cateSeqList); // 
		resultVO.setProductList(productList);
		
		log.info("========================");
		log.info("productCateNo : {} ", productCateNo);
		log.info("productCategoryType : {} ", productCategoryType);
		log.info("cateSeqList : {} ", cateSeqList);
		log.info("productList : {} ", productList);
		log.info("UserCategoryProductVO : ", resultVO);
		log.info("========================");
		// 3. 상품 이미지 리스트
		List<UserBaseProductsImageVO> productImgList = imageMapper.getPresentiveImageList(productList);
		// 4. 
		
		UserCategoryProductVO categoryProductVO = new UserCategoryProductVO();
		
		return resultVO;
	}

}
