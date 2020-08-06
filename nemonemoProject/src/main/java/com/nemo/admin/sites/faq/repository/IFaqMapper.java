package com.nemo.admin.sites.faq.repository;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.BaseFaqVO;

public interface IFaqMapper {

	public int insertFaq(BaseFaqVO vo);
	public int deleteFaq(int faqNo);
	public int updateFaq(BaseFaqVO vo);
	public AdminFaqResponseVO getFaq(int faqNo);
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode);
	
}
