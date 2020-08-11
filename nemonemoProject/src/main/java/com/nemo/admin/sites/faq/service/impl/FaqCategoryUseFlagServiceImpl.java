package com.nemo.admin.sites.faq.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqCategoryMapper;
import com.nemo.admin.sites.faq.service.FaqCategoryUseFlagService;

@Service
public class FaqCategoryUseFlagServiceImpl implements FaqCategoryUseFlagService {

	@Autowired
	private FaqCategoryMapper faqCategoryMapper;
	
	@Override
		public int updateUseFlag(Map<String, Object> useFlagUpdateParamMap) {
			return faqCategoryMapper.useFlagUpdate(useFlagUpdateParamMap);
		}
}
