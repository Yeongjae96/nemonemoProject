package com.nemo.admin.members.terms.service;

import java.util.List;

import com.nemo.admin.members.terms.vo.TermsHistVO;

/**
 * @제목 : 약관내역 전체조회 서비스 인터페이스
 * @패키지이름 : com.nemo.admin.members.terms.service
 * @파일이름 : GetTermsHistListService.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Hyein
 * @프로그램설명 : 약관내역 테이블의 모든 목록을 조회하는 서비스 인터페이스이다.
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 * 	20.08.10 	이혜인			초기설정
 */
public interface GetTermsHistListService {
	public List<TermsHistVO> getTermsHistList();
}
