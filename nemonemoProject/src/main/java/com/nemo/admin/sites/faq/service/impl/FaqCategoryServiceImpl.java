package com.nemo.admin.sites.faq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqCategoryMapper;
import com.nemo.admin.sites.faq.service.FaqCategoryService;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqCategoryVO;

@Service
public class FaqCategoryServiceImpl implements FaqCategoryService {

	@Autowired
	private FaqCategoryMapper faqCategoryMapper;
	
	@Override
	public int insertFaqCategory(AdminBaseFaqCategoryVO vo) {
		
		if(faqCategoryMapper.checkCategoryName(vo.getFaqCategoryName()) == 1) return 0;
		return faqCategoryMapper.insertFaqCategory(vo);
	}

	@Override
	public int deleteFaqCategory(int faqCategoryNo) {
		return faqCategoryMapper.deleteFaqCategory(faqCategoryNo);
	}

	@Override
	public int updateFaqCategory(AdminBaseFaqCategoryVO vo) {
		return faqCategoryMapper.updateFaqCategory(vo);
	}

	@Override
	public AdminBaseFaqCategoryVO getFaqCategory(int faqCategoryNo) {
		return faqCategoryMapper.getFaqCategory(faqCategoryNo);
	}

	@Override
	public List<AdminBaseFaqCategoryVO> getFaqCategoryList(String faqCategoryUseFlMode) {
		return faqCategoryMapper.getFaqCategoryList(faqCategoryUseFlMode);
	}
	
}
