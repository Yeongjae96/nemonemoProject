package com.nemo.user.customer.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.customer.faq.vo.UserBaseFaqCategoryVO;
import com.nemo.user.customer.faq.vo.UserBaseFaqVO;
import com.nemo.user.customer.repository.ICustomerFaqMapper;

@Mapper
public interface CustomerFaqMapper extends ICustomerFaqMapper{
	
	public int getFaqCategoryStartNum();
	public List<UserBaseFaqVO> getSelectFaqList(int faqCategoryNo);
	public List<UserBaseFaqCategoryVO> getFaqCategoryList();
}
