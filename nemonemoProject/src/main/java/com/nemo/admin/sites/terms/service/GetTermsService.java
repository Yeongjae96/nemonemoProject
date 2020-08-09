package com.nemo.admin.sites.terms.service;

import com.nemo.admin.sites.terms.vo.AdminBaseTermsVO;

/**
 * @제목 : 약관 상세정보 서비스 인터페이스
 * @패키지이름 : com.nemo.admin.sites.terms.service
 * @파일이름 : GetTermsService.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : 약관 상세정보를 얻어오는 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				terms 초기설정
 */
public interface GetTermsService {
	public AdminBaseTermsVO getTerms(int termsNo);
}
