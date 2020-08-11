package com.nemo.admin.sites.terms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.terms.repository.impl.TermsMapper;
import com.nemo.admin.sites.terms.service.GetTermsListService;
import com.nemo.admin.sites.terms.vo.TermsVO;

@Service
public class GetTermsListServiceImpl implements GetTermsListService {

	@Autowired
	private TermsMapper termsDAO;
	
	@Override
	public List<TermsVO> getTermsList() {
		return termsDAO.getTermsList();
	}

}
