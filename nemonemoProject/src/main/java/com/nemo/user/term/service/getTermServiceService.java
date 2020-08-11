package com.nemo.user.term.service;


import com.nemo.user.term.vo.TermVO;


/**
 * @제목 : Term Servcie 인터페이스
 * @패키지이름 : com.nemo.user.term.service
 * @파일이름 : TermService.java
 * @작성일 : 2020. 8. 9
 * @이름 : Hyein
 * @프로그램설명 : Term 요청에 대한 Service 인터페이스
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------		-------------	
 * 20.08.09			이혜인			초기설정
 */
public interface getTermServiceService {
	public TermVO getTermService(String termTitle);
}
