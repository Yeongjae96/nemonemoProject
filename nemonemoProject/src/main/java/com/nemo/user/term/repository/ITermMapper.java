package com.nemo.user.term.repository;

import java.util.List;

import com.nemo.admin.sites.terms.vo.TermsVO;
import com.nemo.user.customer.vo.UserNoticeVO;
import com.nemo.user.term.vo.TermVO;

/**
 * @제목 : ITermMapper
 * @패키지이름 : com.nemo.user.term.repository
 * @파일이름 : ITermMapper.java
 * @작성일 : 2020. 8. 9
 * @이름 : Hyein
 * @프로그램설명 : Mybatis를 이용한 DB접근을 담당하는 Mapper 인터페이스
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------		-------------	
 * 20.08.09			이혜인			초기설정
 */
public interface ITermMapper {
	public TermVO getTermService(String termTitle);
	public TermVO getTermPrivacy(String termTitle);
	public TermVO getTermLocation(String termTitle);
}
