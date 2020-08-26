package com.nemo.admin.sites.faq.repository;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

/**
 * @제목 : FAQ 테이블의 기본 매퍼
 * @패키지이름 : com.nemo.admin.sites.faq.repository
 * @파일이름 : IFaqMapper.java
 * @작성일 : 2020. 8. 6.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 테이블의 기본 CRUD에 관한 매퍼
 */
public interface IFaqMapper {

	public int insertFaq(AdminBaseFaqVO vo);
	public int deleteFaq(int faqNo);
	public int updateFaq(AdminBaseFaqVO vo);
	public AdminFaqResponseVO getFaq(int faqNo);
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode);
	
}
