package com.nemo.admin.sites.terms.repository.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.admin.sites.terms.repository.TermsDAO;
import com.nemo.admin.sites.terms.vo.TermsVO;

@Repository
public class TermsDAOMybatis implements TermsDAO {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertTerms(TermsVO vo) {
		return session.insert("com.nemo.admin.sites.terms.repository.impl.TermsDAOMybatis.insertTerms", vo);
	}

	@Override
	public int deleteTerms(int termsNo) {
		return session.delete("com.nemo.admin.sites.terms.repository.impl.TermsDAOMybatis.deleteTerms", termsNo);

	}

	@Override
	public int updateTemrs(TermsVO vo) {
		return session.insert("com.nemo.admin.sites.terms.repository.impl.TermsDAOMybatis.updateTerms", vo);
	}

	@Override
	public TermsVO getTerms(int termsNo) {
		return session.selectOne("com.nemo.admin.sites.terms.repository.impl.TermsDAOMybatis.getTerms", termsNo);
	}

	@Override
	public List<TermsVO> getTermsList() {
		return session.selectList("com.nemo.admin.sites.terms.repository.impl.TermsDAOMybatis.getTermsList");
	}
	
	
}
