package com.nemo.user.customer.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.customer.faq.vo.BaseUserFaqCategoryVO;
import com.nemo.user.customer.faq.vo.BaseUserFaqVO;
import com.nemo.user.customer.repository.ICustomerFaqMapper;

@Mapper
public interface CustomerFaqMapper extends ICustomerFaqMapper{
	
	public int getFaqCategoryStartNum();
	public List<BaseUserFaqVO> getSelectFaqList(int faqCategoryNo);
	public List<BaseUserFaqCategoryVO> getFaqCategoryList();
}
