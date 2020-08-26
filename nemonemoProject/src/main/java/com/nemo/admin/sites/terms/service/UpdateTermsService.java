package com.nemo.admin.sites.terms.service;

import com.nemo.admin.sites.terms.vo.TermsVO;

/**
 * @제목 : 약관 업데이트 서비스
 * @패키지이름 : com.nemo.admin.sites.terms.service
 * @파일이름 : UpdateTermsService.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : 약관을 수정하는 서비스의 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				terms 초기설정
 */
public interface UpdateTermsService {
	public int updateTerms(TermsVO vo);
}
