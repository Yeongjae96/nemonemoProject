package com.nemo.admin.sites.faq.repository;

import java.util.List;

import com.nemo.admin.sites.faq.vo.FaqCategoryVO;

public interface IFaqCategoryMapper {
	
	public int insertFaqCategory(FaqCategoryVO vo);
	public int updateFaqCategory(FaqCategoryVO vo);
	public int deleteFaqCategory(int faqCategoryNo);
	public FaqCategoryVO getFaqCategory(int faqCategoryNo);
	public List<FaqCategoryVO> getFaqCategoryList(String faqCategoryUseFlMode);
}
