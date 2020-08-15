package com.nemo.user.products.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.repository.impl.UserGetProductMapper;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.service.GetProductService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserGetProductVO;
import com.nemo.user.products.vo.UserSelectedProductVO;

@Service
public class GetProductServiceImpl implements GetProductService {

	private Logger log = LoggerFactory.getLogger(GetProductServiceImpl.class);
	
	@Autowired
	private UserProductsCategoryMapper categoryMapper;
	@Autowired
	private UserGetProductMapper getProductMapper;

	@Override
	public UserGetProductVO getProduct(int productNo) {

		UserGetProductVO resultVO = new UserGetProductVO();
		// 1. 선택된 상품정보에 대한 카테고리 및 상품정보 및 해당 상품 이미지
		UserSelectedProductVO selectedProduct = getProductMapper.selectProductFromPdSeq(productNo); // 1. 시퀀스로 타입 검색
		
		log.info("결과값  : {} ", selectedProduct);
		
		resultVO.setSelectedProduct(selectedProduct);
		
		
		// 2. 전체 카테고리 리스트 || 2. 카테고리 타입에 따른 상품 리스트
		List<UserBaseProductsCategoryVO> list = categoryMapper.getAllCategoryList();

		// 3. 카테고리 타입에 따른 필터링
		UserBaseProductsCategoryVO seqCate = selectedProduct.getProductCateVO();
		Map<String, List<UserBaseProductsCategoryVO>> categoryMap = new HashMap<>();

		List<UserBaseProductsCategoryVO> large = new ArrayList<>();
		List<UserBaseProductsCategoryVO> medium = new ArrayList<>();
		List<UserBaseProductsCategoryVO> small = new ArrayList<>();

		for (UserBaseProductsCategoryVO vo : list) {
			if (vo.getProductCateType().equals("L")) {
				large.add(vo);
			} else if (vo.getProductCateType().equals("M")
					&& vo.getProductCateLarge().equals(seqCate.getProductCateLarge())) {
				medium.add(vo);
			} else if (vo.getProductCateType().equals("S")
					&& vo.getProductCateMedium().equals(seqCate.getProductCateMedium())) {
				small.add(vo);
			}
		}
		categoryMap.put("L", large);
		categoryMap.put("M", medium);
		categoryMap.put("S", small);
		
		resultVO.setCategoryMap(categoryMap);
		
		return resultVO;
	}
}
