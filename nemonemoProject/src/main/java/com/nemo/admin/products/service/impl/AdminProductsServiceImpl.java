package com.nemo.admin.products.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.products.repository.impl.AdminProductsMapper;
import com.nemo.admin.products.service.AdminProductsService;
import com.nemo.admin.products.vo.AdminProductResponseVO;

/**
 * @제목 : 상품리스트 서비스 구현
 * @패키지이름 : com.nemo.admin.products.service.impl
 * @파일이름 : ProductsServiceImpl.java
 * @작성일 : 2020. 8. 22
 * @이름 : Yerin
 * @프로그램설명 : 관리자 페이지 상품목록 서비스를 구현하는 Impl 클래스이다.
 */

@Service
public class AdminProductsServiceImpl implements AdminProductsService{

	@Autowired
	public AdminProductsMapper productsMapper;


	@Override
	public List<AdminProductResponseVO> getProductList(String disp) {
		return productsMapper.getProductList(disp);
	}

	@Override
	public int displayProductFlag(Map<String, Object> dispFlagParamMap) {
		return productsMapper.displayProductFlag(dispFlagParamMap);
	}



}
