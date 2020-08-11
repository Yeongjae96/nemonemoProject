package com.nemo.admin.sites.faq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqMapper;
import com.nemo.admin.sites.faq.service.FaqService;
import com.nemo.admin.sites.faq.vo.AdminFaqRequestVO;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;
	
	@Override
	public int insertFaq(AdminFaqRequestVO vo) {
		return faqMapper.insertFaq(vo);
	}

	@Override
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode) {
		return faqMapper.getFaqList(useFlagMode);
	}

}
