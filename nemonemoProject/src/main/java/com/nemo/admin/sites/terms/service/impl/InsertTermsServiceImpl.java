package com.nemo.admin.sites.terms.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.ITermsMapper;
import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.InsertTermsService;
import com.nemo.admin.sites.terms.vo.AdminBaseTermsVO;

@Service
public class InsertTermsServiceImpl implements InsertTermsService{
	
	@Autowired
	private TermsMapper termsDAO;
	
	@Override
	public int insertTerms(AdminBaseTermsVO vo) {
		vo.setTermsRegistryYmd(new Date(System.currentTimeMillis()));
		return termsDAO.insertTerms(vo);
	}
}
