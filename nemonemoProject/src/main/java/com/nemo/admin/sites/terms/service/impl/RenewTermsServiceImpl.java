package com.nemo.admin.sites.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.RenewTermsService;
import com.nemo.admin.sites.terms.vo.TermsVO;

@Service
public class RenewTermsServiceImpl implements RenewTermsService{

	@Autowired
	private TermsMapper termsDAO;

	@Override
	public int renewTerms(TermsVO vo) {
		return termsDAO.renewTerms(vo);
	}

}
