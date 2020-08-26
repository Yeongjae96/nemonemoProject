package com.nemo.admin.members.member.repository;

import java.util.List;

import com.nemo.admin.members.member.vo.AdminBaseMemberVO;
import com.nemo.admin.members.member.vo.TermsCheckedVO;

public interface IMemberMapper {

	
	public int updateMember(AdminBaseMemberVO vo);
	public AdminBaseMemberVO getMember(int userNo);
	public List<AdminBaseMemberVO> getMemberList(AdminBaseMemberVO vo);
	public List<TermsCheckedVO> getTerms(int userNo);
	
}
