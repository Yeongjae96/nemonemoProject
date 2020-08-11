package com.nemo.admin.sites.terms.service;

import com.nemo.admin.sites.terms.vo.TermsVO;

/**
 * @제목 : 약관 갱신 서비스
 * @패키지이름 : com.nemo.admin.sites.terms.service
 * @파일이름 : RenewTermsService.java
 * @작성일 : 2020. 8. 8.
 * @이름 : Hyein
 * @프로그램설명 : 약관을 갱신하는 서비스의 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 * 	20.08.08 	이혜인			초기설정
 */
public interface RenewTermsService {
	public int renewTerms(TermsVO vo);
}
