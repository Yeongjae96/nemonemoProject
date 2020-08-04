package com.nemo.admin.sites.faq.service;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminFaqRequestVO;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;

/**
 * @제목 : Faq 서비스
 * @패키지이름 : com.nemo.admin.sites.faq.service
 * @파일이름 : FaqService.java
 * @작성일 : 2020. 8. 1.
 * @이름 : Yeong
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public interface FaqService {
	public int insertFaq(AdminFaqRequestVO vo);
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode);
}
