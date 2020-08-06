package com.nemo.admin.sites.faq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqMapper;
import com.nemo.admin.sites.faq.service.FaqService;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.BaseFaqVO;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;
	
	@Override
	public int insertFaq(BaseFaqVO vo) {
		return faqMapper.insertFaq(vo);
	}

	@Override
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode) {
		return faqMapper.getFaqList(useFlagMode);
	}
	
	@Override
	public AdminFaqResponseVO getFaq(int faqNo) {
		return faqMapper.getFaq(faqNo);
	}
	
	@Override
	public int updateFaq(BaseFaqVO vo) {
		return faqMapper.updateFaq(vo);
	}
	
	@Override
	public int deleteFaq(int faqNo) {
		return faqMapper.deleteFaq(faqNo);
	}
}
