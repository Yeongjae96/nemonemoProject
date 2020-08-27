package com.nemo.user.categories.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.paging.PageVO;
import com.nemo.common.paging.Pagination;
import com.nemo.user.categories.service.CategoryService;
import com.nemo.user.categories.vo.PdImgArticleVO;
import com.nemo.user.categories.vo.UserCategoryBoardVO;
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
	public UserCategoryBoardVO getCategoryProducts(int productCateNo, PageVO pageVO) {
		
		// 0. 리턴값
		UserCategoryBoardVO resultVO = new UserCategoryBoardVO();

		Map<String, Object> map = new HashMap<>();
		// 1. 카테고리 타입
		UserBaseProductsCategoryVO seqCate = categoryMapper.searchCateSeq(productCateNo); // 1. 시퀀스로 타입 검색
		String productCategoryType = seqCate.getProductCateType();
		
		resultVO.setSelectedCategory(seqCate);
		
		// 2. 전체 카테고리 리스트 || 2. 카테고리 타입에 따른 상품 리스트
		List<UserBaseProductsCategoryVO> list = categoryMapper.getAllCategoryList();
		
		map.put("productCateType", productCategoryType);
		map.put("productCateNo", productCateNo);
		
		// 3. 카테고리 타입에 따른 필터링
		
		  Map<String, List<UserBaseProductsCategoryVO>> categoryMap = new HashMap<>();
		 
		  List<UserBaseProductsCategoryVO> large = new ArrayList<>();
		  List<UserBaseProductsCategoryVO> medium = new ArrayList<>();
		  List<UserBaseProductsCategoryVO> small = new ArrayList<>();
		  
		  for(UserBaseProductsCategoryVO vo : list ) {
			  if(vo.getProductCateType().equals("L")) { 
				  large.add(vo); 
			  } 
			  else if(vo.getProductCateType().equals("M") && vo.getProductCateLarge().equals(seqCate.getProductCateLarge()))  { 
				  medium.add(vo); 
			  } else if(vo.getProductCateType().equals("S") && vo.getProductCateMedium().equals(seqCate.getProductCateMedium())) {
				  small.add(vo); 
			  } 
		  }
		  
		  categoryMap.put("L", large); categoryMap.put("M", medium); categoryMap.put("S",
		  small);
		 
		// 카테고리 리스트 장착! // 3,2,1
		resultVO.setCategoryMap(categoryMap);
		
		List<Integer> cateSeqList = categoryMapper.selectChildrenCateNums(map); // 2. 시퀀스와 타입으로 해당 하위 시퀀스리스트 검색
		if(cateSeqList.size() == 0) return resultVO;
		
		/* 페이징 처리를 위한 개수  */
		Pagination paging = new Pagination(pageVO);
		Map<String, Object> selectCatePdParamMap = new HashMap<>();
		
		selectCatePdParamMap.put("cateSeqList", cateSeqList);
		selectCatePdParamMap.put("startNo", paging.getStartPageNo());
		selectCatePdParamMap.put("endNo", paging.getEndPageNo());
		
		List<UserBaseProductsVO> productList = productMapper.selectCategoryProducts(selectCatePdParamMap); // 
		if(productList.size() == 0) return resultVO;
		
		PageVO page = paging.getCalcPageVO(productList.size());
		resultVO.setPageVO(page);
		
		// 3. 상품 이미지 리스트
		List<UserBaseProductsImageVO> pdImgArticle = imageMapper.selectPresentiveImg(productList);
		if(pdImgArticle == null) return resultVO;

		// 4
		List<PdImgArticleVO> pdImgArticleList = new ArrayList<>();
		
		for(UserBaseProductsImageVO i : pdImgArticle) {
			for(UserBaseProductsVO p : productList) {
				if(i.getProductNo() == p.getProductNo()) {
					PdImgArticleVO pdImgArticleVO = new PdImgArticleVO();
					pdImgArticleVO.setProductVO(p);
					pdImgArticleVO.setProductImageVO(i);
					pdImgArticleList.add(pdImgArticleVO);
				}
			}
		}
		
		resultVO.setPdImgArticleList(pdImgArticleList);
		
		return resultVO;
	}

}
