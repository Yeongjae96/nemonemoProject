package com.nemo.admin.sites.faq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqMapper;
import com.nemo.admin.sites.faq.service.FaqUseFlagService;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

@Service
public class FaqUserFlagServiceImpl implements FaqUseFlagService {

	@Autowired
	private FaqMapper faqMapper;
	
	@Override
	public int updateUseFlag(AdminBaseFaqVO vo) {
		return faqMapper.updateUseFlag(vo);
	}

}
