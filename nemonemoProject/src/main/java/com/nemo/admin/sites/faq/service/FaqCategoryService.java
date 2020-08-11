package com.nemo.admin.sites.faq.service;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminBaseFaqCategoryVO;

/**
 * @제목 : FAQ 카테고리  CRUD 서비스
 * @패키지이름 : com.nemo.admin.sites.faq.repository
 * @파일이름 : FaqCategoryService.java
 * @작성일 : 2020. 8. 2.
 * @이름 : Yeong
 * @프로그램설명 : FAQ의 카테고리 기본적인 CRUD의 서비스 인터페이스 
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public interface FaqCategoryService {
	
	public int insertFaqCategory(AdminBaseFaqCategoryVO vo);
	public int deleteFaqCategory(int faqCategoryNo);
	public int updateFaqCategory(AdminBaseFaqCategoryVO vo);
	public AdminBaseFaqCategoryVO getFaqCategory(int faqCategoryNo);
	public List<AdminBaseFaqCategoryVO> getFaqCategoryList(String faqCategoryUseFlMode);
}
