package com.nemo.admin.sites.terms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.ITermsMapper;
import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.UpdateTermsService;
import com.nemo.admin.sites.terms.vo.TermsVO;

@Service
public class UpdateTermsServiceImpl implements UpdateTermsService {

	@Autowired
	private TermsMapper termsDAO;
	
	@Override
	public int updateTerms(TermsVO vo) {
		return termsDAO.updateTemrs(vo);
	}

}
