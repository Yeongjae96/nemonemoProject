package com.nemo.admin.sites.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.TermsDAO;
import com.nemo.admin.sites.terms.service.GetTermsService;
import com.nemo.admin.sites.terms.vo.TermsVO;

@Service
public class GetTermsServiceImpl implements GetTermsService {

	@Autowired
	private TermsDAO termsDAO;
	
	@Override
	public TermsVO getTerms(int termsNo) {
		// TODO Auto-generated method stub
		return termsDAO.getTerms(termsNo);
	}

}
