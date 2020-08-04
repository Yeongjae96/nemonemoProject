package com.nemo.admin.sites.faq.repository;

import java.util.List;

import com.nemo.admin.sites.faq.vo.AdminFaqRequestVO;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;

public interface IFaqMapper {

	public int insertFaq(AdminFaqRequestVO vo);
	public int deleteFaq(int faqNo);
	public int updateFaq(AdminFaqRequestVO vo);
	public AdminFaqResponseVO getFaq(int faqNo);
	public List<AdminFaqResponseVO> getFaqList(String useFlagMode);
	
}
