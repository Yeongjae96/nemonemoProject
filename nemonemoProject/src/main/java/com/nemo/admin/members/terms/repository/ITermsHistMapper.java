package com.nemo.admin.members.terms.repository;

import java.util.List;

import com.nemo.admin.members.terms.vo.TermsHistVO;

public interface ITermsHistMapper {
	public TermsHistVO getTermsHist(int termsHistNo);
	public List<TermsHistVO> getTermsHistList();
}
