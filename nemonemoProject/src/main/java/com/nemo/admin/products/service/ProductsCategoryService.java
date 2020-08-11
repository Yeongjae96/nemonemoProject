package com.nemo.admin.products.service;

import java.util.List;

import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

/**
 * @제목 : 상품 카테고리 서비스
 * @패키지이름 : com.nemo.admin.products.service
 * @파일이름 : ProductsCategoryService.java
 * @작성일 : 2020. 8. 9.
 * @이름 : Yeong
 * @프로그램설명 : 상품 카테고리에 기본적인 CRUD를 담당하는 서비스이다.
 */
public interface ProductsCategoryService {
	
	public int insertProductCategory(AdminBaseProductsCategoryVO vo);
	public AdminBaseProductsCategoryVO getCategory(int productCateNo);
	public int updateProductCategory(AdminBaseProductsCategoryVO vo);
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo);
	public int deleteProductCategory(int productsCateNo);
	
	public int changeUseFlagCategoryJson(AdminBaseProductsCategoryVO vo);
}
