package com.nemo.admin.members.terms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.terms.repository.impl.TermsHistMapper;
import com.nemo.admin.members.terms.service.GetTermsHistListService;
import com.nemo.admin.members.terms.vo.TermsHistVO;

@Service("GetTermsHistListService")
public class GetTermsHistListServiceImpl implements GetTermsHistListService {

	@Autowired
	private TermsHistMapper termsHistDAO;

	@Override
	public List<TermsHistVO> getTermsHistList() {
		return termsHistDAO.getTermsHistList();
	}

}
