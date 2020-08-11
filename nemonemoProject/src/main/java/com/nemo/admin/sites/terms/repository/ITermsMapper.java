package com.nemo.admin.sites.terms.repository;

import java.util.List;

import com.nemo.admin.sites.terms.vo.TermsVO;

public interface ITermsMapper {
	public int insertTerms(TermsVO vo);
	public int deleteTerms(int termsNo);
	public int updateTemrs(TermsVO vo);
	public TermsVO getTerms(int termsNo);
	public List<TermsVO> getTermsList();
}
