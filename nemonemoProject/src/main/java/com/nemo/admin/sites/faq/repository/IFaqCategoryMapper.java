package com.nemo.admin.sites.faq.repository;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminBaseFaqCategoryVO;

/**
 * @제목 : FAQ 카테고리 테이블의 기본 매퍼
 * @패키지이름 : com.nemo.admin.sites.faq.repository
 * @파일이름 : IFaqCategoryMapper.java
 * @작성일 : 2020. 8. 6.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 카테고리 테이블의 기본 매퍼
 */
public interface IFaqCategoryMapper {
	
	public int insertFaqCategory(AdminBaseFaqCategoryVO vo);
	public int updateFaqCategory(AdminBaseFaqCategoryVO vo);
	public int deleteFaqCategory(int faqCategoryNo);
	public AdminBaseFaqCategoryVO getFaqCategory(int faqCategoryNo);
	public List<AdminBaseFaqCategoryVO> getFaqCategoryList(String faqCategoryUseFlMode);
}
