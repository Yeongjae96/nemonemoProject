package com.nemo.user.products.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.service.GetProductService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsVO;
import com.nemo.user.products.vo.UserGetProductVO;

@Service
public class GetProductServiceImpl implements GetProductService{
	
	@Autowired
	private UserProductsCategoryMapper categoryMapper;
	@Autowired
	private ProductsMapper productsMapper;
	
	@Override
	public UserGetProductVO getProduct(int productNo) {
		
		UserGetProductVO resultVO = new UserGetProductVO();
//		Map<String, Object> map = new HashMap<>();
//		
//		// 1. 선택된 상품 정보
//		UserBaseProductsVO productVO = productsMapper.selectProduct(productNo);
//		resultVO.setSelectedPd(productVO);
//		
//		// 2. 선택된 상품정보에 대한 
//		UserBaseProductsCategoryVO seqCate = categoryMapper.searchCateSeq(productVO); // 1. 시퀀스로 타입 검색
//		String productCategoryType = seqCate.getProductCateType();
//		
//		resultVO.setSelectedCate(seqCate);
//		
//		// 2. 전체 카테고리 리스트 || 2. 카테고리 타입에 따른 상품 리스트
//		List<UserBaseProductsCategoryVO> list = categoryMapper.getAllCategoryList();
//		
//		map.put("productCateType", productCategoryType);
//		map.put("productCateNo", productCateNo);
//		
//		// 3. 카테고리 타입에 따른 필터링
//		
//		  Map<String, List<UserBaseProductsCategoryVO>> categoryMap = new HashMap<>();
//		 
//		  List<UserBaseProductsCategoryVO> large = new ArrayList<>();
//		  List<UserBaseProductsCategoryVO> medium = new ArrayList<>();
//		  List<UserBaseProductsCategoryVO> small = new ArrayList<>();
//		  
//		  for(UserBaseProductsCategoryVO vo : list ) {
//			  if(vo.getProductCateType().equals("L")) { 
//				  large.add(vo); 
//			  } 
//			  else if(vo.getProductCateType().equals("M") && vo.getProductCateLarge().equals(seqCate.getProductCateLarge()))  { 
//				  medium.add(vo); 
//			  } else if(vo.getProductCateType().equals("S") && vo.getProductCateMedium().equals(seqCate.getProductCateMedium())) {
//				  small.add(vo); 
//			  } 
//		  }
//		  
//		  categoryMap.put("L", large); categoryMap.put("M", medium); categoryMap.put("S",
//		  small);
		
		
		
		return resultVO;
	}
}
