package com.nemo.admin.sites.terms.service;

import com.nemo.admin.sites.terms.vo.AdminBaseTermsVO;

/**
 * @제목 : 약관 추가 인터페이스
 * @패키지이름 : com.nemo.admin.sites.terms.service
 * @파일이름 : InsertTermsService.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : 약관을 추가하는 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				terms 초기설정
 */
public interface InsertTermsService {
	public int insertTerms(AdminBaseTermsVO vo);
}
