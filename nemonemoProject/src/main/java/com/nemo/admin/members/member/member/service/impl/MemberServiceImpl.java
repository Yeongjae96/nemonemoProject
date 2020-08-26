package com.nemo.admin.members.member.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.member.member.service.MemberService;
import com.nemo.admin.members.member.repository.impl.MemberMapper;
import com.nemo.admin.members.member.vo.AdminBaseMemberVO;
import com.nemo.admin.members.member.vo.TermsCheckedVO;

/**
 * @제목 : Member 서비스 구현체
 * @패키지이름 : com.nemo.admin.members.member.member.service.impl
 * @파일이름 : MemberServiceImpl.java
 * @작성일 : 2020. 8. 17
 * @이름 : Yerin
 * @프로그램설명 : MEMBER 테이블 CRUD 구현하는  서비스 
 */
@Service

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	

	@Override
	public int updateMember(AdminBaseMemberVO vo) {
		return memberMapper.updateMember(vo);
	}

	@Override
	public AdminBaseMemberVO getMember(int userNo) {
		return memberMapper.getMember(userNo);
	}

	@Override
	public List<AdminBaseMemberVO> getMemberList(AdminBaseMemberVO vo) {
		return memberMapper.getMemberList(vo);
	}

	@Override
	public List<TermsCheckedVO> getTerms(int userNo) {
		return memberMapper.getTerms(userNo);
	}


}
