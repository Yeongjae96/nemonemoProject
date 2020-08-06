package com.nemo.user.customer.service;

import java.util.List;

import com.nemo.user.customer.faq.vo.BaseUserFaqCategoryVO;
import com.nemo.user.customer.faq.vo.BaseUserFaqVO;

public interface CustomerFaqService {
	public int getFaqCategoryStartNum();
	public List<BaseUserFaqVO> getFaqList(int faqCategoryNo);
	public List<BaseUserFaqCategoryVO> getFaqCategoryList();	
}
