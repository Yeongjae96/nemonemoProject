package com.nemo.admin.products.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.products.repository.impl.ProductsCategoryMapper;
import com.nemo.admin.products.service.ProductsCategoryService;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

/**
 * @제목 : 상품 카테고리 서비스 구현
 * @패키지이름 : com.nemo.admin.products.service.impl
 * @파일이름 : ProductsCategoryServiceImpl.java
 * @작성일 : 2020. 8. 9.
 * @이름 : Yeong
 * @프로그램설명 : 상품 카테고리 서비스를 구현하는 Impl 클래스이다.
 */
@Service
public class ProductsCategoryServiceImpl implements ProductsCategoryService {

	@Autowired
	public ProductsCategoryMapper productsCategoryMapper;

	@Override
	public int insertProductCategory(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.insertProductsCategory(vo);
	}

	@Override
	public int updateProductCategory(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.updateProductsCategory(vo);
	}

	@Override
	public AdminBaseProductsCategoryVO getCategory(int productCateNo) {
		return productsCategoryMapper.getProductsCategory(productCateNo);
	}

	@Override
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.getCategoryList(vo);
	}
	
@Override
	public int deleteProductCategory(int productsCateNo) {
		return productsCategoryMapper.deleteProductsCategory(productsCateNo);
	}

	@Override
	public int changeUseFlagCategoryJson(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.changeUseFlagCategoryJson(vo);
	}
}
