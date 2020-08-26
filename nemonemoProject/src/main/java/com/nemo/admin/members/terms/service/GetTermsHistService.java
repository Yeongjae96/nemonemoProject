package com.nemo.admin.members.terms.service;

import com.nemo.admin.members.terms.vo.TermsHistVO;

/**
 * @제목 : 약관내역 상세정보 서비스 인터페이스
 * @패키지이름 : com.nemo.admin.members.terms.service
 * @파일이름 : GetTermsHistService.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Hyein
 * @프로그램설명 : 약관내역 상세정보를 얻어오는 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 * 	20.08.10 	이혜인			초기설정
 */
public interface GetTermsHistService {
	public TermsHistVO getTermsHist(int termsHistNo);
}
