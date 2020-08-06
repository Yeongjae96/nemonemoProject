package com.nemo.user.customer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.faq.vo.BaseUserFaqCategoryVO;
import com.nemo.user.customer.faq.vo.BaseUserFaqVO;
import com.nemo.user.customer.repository.impl.CustomerMapper;
import com.nemo.user.customer.service.CustomerFaqService;

@Service
public class CustomerFaqServiceImpl implements CustomerFaqService{

	@Autowired
	private CustomerFaqMapper customerFaqMapper;
	
	@Override
	public int getFaqCategoryStartNum() {
		return customerFaqMapper.getFaqCategoryStartNum();
	}

	@Override
	public List<BaseUserFaqVO> getFaqList(int faqCategoryNo) {
		return customerFaqMapper.getSelectFaqList(faqCategoryNo);
	}

	@Override
	public List<BaseUserFaqCategoryVO> getFaqCategoryList() {
		return customerFaqMapper.getFaqCategoryList();
	}
		
}
