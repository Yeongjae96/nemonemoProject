package com.nemo.admin.members.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.terms.repository.impl.TermsHistMapper;
import com.nemo.admin.members.terms.service.GetTermsHistService;
import com.nemo.admin.members.terms.vo.TermsHistVO;

@Service("GetTermsHistService")
public class GetTermsHistServiceImpl implements GetTermsHistService {

	@Autowired
	private TermsHistMapper termsHistDAO;
	
	@Override
	public TermsHistVO getTermsHist(int termsHistNo) {
		return termsHistDAO.getTermsHist(termsHistNo);
	}

}
