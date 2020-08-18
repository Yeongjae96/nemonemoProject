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
	
	@Override
	public SearchProductsVO getSearchArticle(String keyword, String order, int categoryNo,  PageVO pageVO) {

		// 0. 페이징 처리
		Pagination page = new Pagination(pageVO);
		
		/* DB조회시 필수 조회 값 : MAPPER에 파라미터로 넘겨야함 변수명 동일해야함(startNo, endNo)*/
		int startNo = page.getStartPageNo();
		int endNo = page.getEndPageNo();
		
		// 1. 검색어에 대한 카테고리 리스트
		List<UserProductsCategoryCntVO> cateListByKeyword = searchProductsMapper.pdCateByKeyword(keyword);
		log.info("{} 키워드 검색 카테고리", cateListByKeyword);
		Map<String, List<UserProductsCategoryCntVO>> categoryMap = new HashMap<>();

		List<UserProductsCategoryCntVO> large = new ArrayList<>();
		List<UserProductsCategoryCntVO> medium = new ArrayList<>();
		List<UserProductsCategoryCntVO> small = new ArrayList<>();

		for (UserProductsCategoryCntVO vo : cateListByKeyword) {
			if (vo.getProductCateType().equals("L")) {
				large.add(vo);
			} else if (vo.getProductCateType().equals("M")) {
				medium.add(vo);
			} else {
				small.add(vo);
			}
		}

		categoryMap.put("large", large);
		categoryMap.put("medium", medium);
		categoryMap.put("small", small);

		// 2. 검색어에 대한 상품 상품이미지 리스트
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("keyword", keyword);
		paramMap.put("order", order);
		paramMap.put("startNo", startNo);
		paramMap.put("endNo", endNo);
		
		List<UserPdPdImgVO> pdPdImgList = searchProductsMapper.pdPdImgByKeyword(paramMap);

		SearchProductsVO searchProductsVO = new SearchProductsVO();
		searchProductsVO.setSearchedCateMap(categoryMap);
		searchProductsVO.setPdPdImgList(pdPdImgList);
		log.info("{} 카테고리 ", categoryMap);
		
		if(categoryNo != -1) {
			UserBaseProductsCategoryVO selectedCategory =  userProductsCategoryMapper.searchCateSeq(categoryNo);
			searchProductsVO.setSelectedCategory(selectedCategory);
		}
		
		int productCnt = searchProductsMapper.allProductCntByKeyword(keyword);
		searchProductsVO.setProductCnt(productCnt);
		
		// 페이징 처리 객체 (jsp:include paging.jsp에 필요한 변수 셋팅)
		PageVO resultPageVO = page.getCalcPageVO(pdPdImgList.size());
		searchProductsVO.setPageVO(resultPageVO);
		
		return searchProductsVO;
	}
}
