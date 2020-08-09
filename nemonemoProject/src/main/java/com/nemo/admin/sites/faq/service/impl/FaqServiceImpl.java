package com.nemo.admin.sites.faq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.faq.repository.impl.FaqMapper;
import com.nemo.admin.sites.faq.service.FaqService;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

/**
 * @제목 : Faq 서비스 구현체
 * @패키지이름 : com.nemo.admin.sites.faq.service.impl
 * @파일이름 : FaqServiceImpl.java
 * @작성일 : 2020. 8. 6.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 테이블 CRUD 구현체 
 */
@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper faqMapper;
	
	@Override
	public int insertFaq(AdminBaseFaqVO vo) {
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
	public int updateFaq(AdminBaseFaqVO vo) {
		return faqMapper.updateFaq(vo);
	}
	
	@Override
	public int deleteFaq(int faqNo) {
		return faqMapper.deleteFaq(faqNo);
	}
}
