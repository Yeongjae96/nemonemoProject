package com.nemo.admin.members.member.member.service;

import java.util.List;

import com.nemo.admin.members.member.vo.AdminBaseMemberVO;
import com.nemo.admin.members.member.vo.TermsCheckedVO;

/**
 * @제목 : MEMBER CRUD 서비스
 * @패키지이름 : com.nemo.admin.members.member.member.service
 * @파일이름 : MemberService.java
 * @작성일 : 2020. 8. 17.
 * @이름 : Yerin
 * @프로그램설명 : 관리자측 회원관리 CRUD의 서비스 인터페이스 
 */
public interface MemberService {
	
	public int updateMember(AdminBaseMemberVO vo);
	public AdminBaseMemberVO getMember(int userNo);
	public List<AdminBaseMemberVO> getMemberList(AdminBaseMemberVO vo);
	public TermsCheckedVO getTerms(int userNo);
	
}
