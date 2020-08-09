package com.nemo.admin.sites.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.ITermsMapper;
import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.GetTermsService;
import com.nemo.admin.sites.terms.vo.AdminBaseTermsVO;

@Service
public class GetTermsServiceImpl implements GetTermsService {

	@Autowired
	private TermsMapper termsDAO;
	
	@Override
	public AdminBaseTermsVO getTerms(int termsNo) {
		// TODO Auto-generated method stub
		return termsDAO.getTerms(termsNo);
	}

}
