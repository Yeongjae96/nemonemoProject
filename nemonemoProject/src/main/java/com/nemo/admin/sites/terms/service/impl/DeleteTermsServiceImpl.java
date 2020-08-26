package com.nemo.admin.sites.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.DeleteTermsService;

@Service
public class DeleteTermsServiceImpl implements DeleteTermsService {

	@Autowired
	private TermsMapper termsDAO;
	
	@Override
	public int deleteTerms(int termsNo) {
		return termsDAO.deleteTerms(termsNo);
	}

}
