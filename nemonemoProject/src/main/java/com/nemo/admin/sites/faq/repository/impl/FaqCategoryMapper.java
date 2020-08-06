package com.nemo.admin.sites.faq.repository.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.sites.faq.repository.IFaqCategoryMapper;

/**
 * @제목 : FAQ 카테고리 테이블의 매퍼
 * @패키지이름 : com.nemo.admin.sites.faq.repository.impl
 * @파일이름 : FaqCategoryMapper.java
 * @작성일 : 2020. 8. 6.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 카테고리 테이블의 매퍼
 */
@Mapper
public interface FaqCategoryMapper extends IFaqCategoryMapper {
	
	public int useFlagUpdate(Map<String, Object> useFlagUpdateParamMap);
	public int checkCategoryName(String faqCategoryName);
}
