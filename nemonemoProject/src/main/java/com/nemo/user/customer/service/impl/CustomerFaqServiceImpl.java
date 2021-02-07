package com.nemo.user.customer.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nemo.user.customer.faq.vo.UserBaseFaqCategoryVO;
import com.nemo.user.customer.faq.vo.UserBaseFaqVO;
import com.nemo.user.customer.repository.impl.CustomerFaqMapper;
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
	@Transactional
	public Map<String, Object> getFaqCategoryListAndSelectFaqList(int faqCategoryNo) {
		
		List<UserBaseFaqCategoryVO> faqCategoryList = customerFaqMapper.getFaqCategoryList();
		List<UserBaseFaqVO> selectFaqList = customerFaqMapper.getSelectFaqList(faqCategoryNo);

		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		resultMap.put("faqCategoryList", faqCategoryList);
		resultMap.put("selectFaqList", selectFaqList);
		
		return resultMap;
	}
		
}
