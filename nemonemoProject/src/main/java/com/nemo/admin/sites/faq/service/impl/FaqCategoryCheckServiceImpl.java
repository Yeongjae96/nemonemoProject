package com.nemo.admin.sites.faq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqCategoryMapper;
import com.nemo.admin.sites.faq.service.FaqCategoryCheckService;

@Service
public class FaqCategoryCheckServiceImpl implements FaqCategoryCheckService{
	
	@Autowired
	private FaqCategoryMapper faqCategoryMapper;
	
	@Override
	public boolean checkFaqCategoryName(String faqCategoryName) {
		int dbResult= faqCategoryMapper.checkCategoryName(faqCategoryName);
		boolean result = dbResult != 0 ? true : false;
		return result;
	}
}
