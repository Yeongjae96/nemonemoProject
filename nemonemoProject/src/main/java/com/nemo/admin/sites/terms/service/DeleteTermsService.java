package com.nemo.admin.sites.terms.service;

/**
 * @제목 : 약관 삭제 서비스 인터페이스
 * @패키지이름 : com.nemo.admin.sites.terms.service
 * @파일이름 : DeleteTermsService.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : 선택한 약관을 삭제하는 서비스 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				terms 초기설정
 */
public interface DeleteTermsService {
	public int deleteTerms(int termsNo);
}
