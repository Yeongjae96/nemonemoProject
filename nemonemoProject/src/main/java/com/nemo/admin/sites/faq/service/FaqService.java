package com.nemo.admin.sites.faq.service;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

/**
 * @제목 : Faq 서비스
 * @패키지이름 : com.nemo.admin.sites.faq.service
 * @파일이름 : FaqService.java
 * @작성일 : 2020. 8. 1.
 * @이름 : Yeong
 * @프로그램설명 : FAQ테이블의 간단한 CRUD 서비스 인터페이스
 * 
 */
public interface FaqService {
	public int insertFaq(AdminBaseFaqVO vo);
	public int updateFaq(AdminBaseFaqVO vo);
	public int deleteFaq(int faqNo);
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode);
	public AdminFaqResponseVO getFaq(int faqNo);
}
