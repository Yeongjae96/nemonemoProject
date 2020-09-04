package com.nemo.user.search.products.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.paging.PageVO;
import com.nemo.common.paging.Pagination;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserProductsCategoryCntVO;
import com.nemo.user.search.products.repository.impl.SearchProductsMapper;
import com.nemo.user.search.products.service.SearchProductsService;
import com.nemo.user.search.products.vo.SearchProductsVO;
import com.nemo.user.search.products.vo.UserPdPdImgVO;
import com.nemo.user.search.repository.impl.SearchTopKeywordMapper;
import com.nemo.user.search.vo.UserBaseTopSearchedVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @제목 : 검색 게시판에 대한 서비스
 * @패키지이름 : com.nemo.user.search.products.service.impl
 * @파일이름 : SearchProductsServiceImpl.java
 * @작성일 : 2020. 8. 18.
 * @이름 : Yeong
 * @프로그램설명 : 검색 게시판에 대한 서비스 반환
 */
@Service
@Slf4j
public class SearchProductsServiceImpl implements SearchProductsService {

	@Autowired
	private SearchProductsMapper searchProductsMapper;

	@Autowired
	private UserProductsCategoryMapper userProductsCategoryMapper;
	
	@Autowired
	private SearchTopKeywordMapper searchTopKeywordMapper;
	
	@Override
	public SearchProductsVO getSearchArticle(String keyword, String order, int categoryNo,  PageVO pageVO) {
		
		// 반환값
		SearchProductsVO searchProductsVO = new SearchProductsVO();
		UserBaseProductsCategoryVO selectedCategory = null;
		Map<String, Object> cateParamMap = new HashMap<String, Object>(); // 카테고리 조회
		Map<String, Object> paramMap = new HashMap<>(); // 상품 조회

		// 카테고리가 선택됐다면 선택된 카테고리 정보 가져오기
		if(categoryNo != -1) {
			selectedCategory =  userProductsCategoryMapper.searchCateSeq(categoryNo);
			searchProductsVO.setSelectedCategory(selectedCategory);
		}
		if(selectedCategory != null) {
			String selectedType = selectedCategory.getProductCateType();
			paramMap.put("selectedType", selectedType);
			cateParamMap.put("selectedType", selectedType);
			String selectedCateName = null;
			switch(selectedType) {
			case "L":
				selectedCateName = selectedCategory.getProductCateLarge();
				break;
			case "M":
				selectedCateName = selectedCategory.getProductCateMedium();
				break;
			case "S":
				selectedCateName = selectedCategory.getProductCateSmall();
				break;
			}
			cateParamMap.put("selectedCateName", selectedCateName);
			paramMap.put("selectedCateName", selectedCateName);
		}
		
		cateParamMap.put("keyword", keyword);
		
		// 페이징 처리
		Pagination page = new Pagination(pageVO);
		
		/* DB조회시 필수 조회 값 : MAPPER에 파라미터로 넘겨야함 변수명 동일해야함(startNo, endNo)*/
		int startNo = page.getStartPageNo();
		int endNo = page.getEndPageNo();
		
		// 1. 검색어에 대한 카테고리 리스트
		List<UserProductsCategoryCntVO> cateListByKeyword = searchProductsMapper.pdCateByKeyword(cateParamMap);
		System.err.println(cateListByKeyword);
		
		/*
		 * Map<String, List<UserProductsCategoryCntVO>> categoryMap = new HashMap<>();
		 */
		searchProductsVO.setSearchedCateList(cateListByKeyword);
		
		
		// 2. 검색어에 대한 상품 상품이미지 리스트
		paramMap.put("keyword", keyword);
		paramMap.put("order", order);
		paramMap.put("startNo", startNo);
		paramMap.put("endNo", endNo);
		
		List<UserPdPdImgVO> pdPdImgList = searchProductsMapper.pdPdImgByKeyword(paramMap);

		
		searchProductsVO.setPdPdImgList(pdPdImgList);
		
		/* searchProductsMapper.allProductCntByKeyword(keyword); */
		int productCnt = pdPdImgList.size();
		searchProductsVO.setProductCnt(productCnt);
		
		
		// 검색어 테이블 데이터 쌓기
		
		UserBaseTopSearchedVO topSearchedVO = new UserBaseTopSearchedVO();
		topSearchedVO.setTopSearchedKeyword(keyword);
		
		searchTopKeywordMapper.insertSearchKeyword(topSearchedVO);
		
		// 페이징 처리 객체 (jsp:include paging.jsp에 필요한 변수 셋팅)
		PageVO resultPageVO = page.getCalcPageVO(pdPdImgList.size());
		searchProductsVO.setPageVO(resultPageVO);
		
		return searchProductsVO;
	}
	
	@Override
	public List<String> searchProductKeyword(String keyword) {
		return searchProductsMapper.selectProductNameByKeyword(keyword);
	}
}
