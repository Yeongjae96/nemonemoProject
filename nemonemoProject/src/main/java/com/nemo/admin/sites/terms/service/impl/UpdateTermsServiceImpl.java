package com.nemo.admin.sites.terms.service.impl;

import java.sql.Date;

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
		vo.setTermsEditYmd(new Date(System.currentTimeMillis()));
		return termsDAO.updateTerms(vo);
	}

}
