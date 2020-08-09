package com.nemo.admin.sites.terms.repository;

import java.util.List;

import com.nemo.admin.sites.terms.vo.AdminBaseTermsVO;

public interface ITermsMapper {
	public int insertTerms(AdminBaseTermsVO vo);
	public int deleteTerms(int termsNo);
	public int updateTerms(AdminBaseTermsVO vo);
	public AdminBaseTermsVO getTerms(int termsNo);
	public List<AdminBaseTermsVO> getTermsList();
}
