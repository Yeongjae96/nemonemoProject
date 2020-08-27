package com.nemo.admin.products.repository.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.products.repository.IAdminProductsMapper;
import com.nemo.admin.products.vo.AdminBaseProductsVO;

/**
 * 
 * @제목 : 상품 목록 매퍼
 * @패키지이름 : com.nemo.admin.products.repository.impl
 * @파일이름 : ProductsMapper.java
 * @작성일 : 2020. 8. 22
 * @이름 : Yerin
 * @프로그램설명 : 상품목록의 DB관련 작업을 도와주는 매퍼 인터페이스
 * 
 */

@Mapper
public interface AdminProductsMapper extends IAdminProductsMapper{
	public int displayProductFlag(Map<String, Object> dispFlagParamMap);

}
