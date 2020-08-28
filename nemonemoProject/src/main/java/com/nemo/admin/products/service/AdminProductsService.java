package com.nemo.admin.products.service;

import java.util.List;
import java.util.Map;

import com.nemo.admin.products.vo.AdminProductResponseVO;

/**
 * @제목 : 상품목록 서비스
 * @패키지이름 : com.nemo.admin.products.service
 * @파일이름 : ProductsService.java
 * @작성일 : 2020. 8. 22
 * @이름 : Yerin
 * @프로그램설명 : 상품 리스트에 기본적인 CRUD를 담당하는 서비스
 * 
 */
public interface AdminProductsService {
	
	public int displayProductFlag(Map<String, Object> dispFlagParamMap);
	public List<AdminProductResponseVO> getProductList(String disp);
}
