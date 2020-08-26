package com.nemo.admin.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.products.repository.IProductsCategoryMapper;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

/**
 * @제목 : 상품 카테고리 매퍼
 * @패키지이름 : com.nemo.admin.products.repository.impl
 * @파일이름 : ProductsCategoryMapper.java
 * @작성일 : 2020. 8. 9.
 * @이름 : Yeong
 * @프로그램설명 : 상품 카테고리의 DB관련 작업을 도와주는 인터페이스이다.
 */
@Mapper
public interface ProductsCategoryMapper extends IProductsCategoryMapper{
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo);
	public int changeUseFlagCategoryJson(AdminBaseProductsCategoryVO vo);
}
