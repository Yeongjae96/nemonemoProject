package com.nemo.user.customer.qna.service;

import com.nemo.user.customer.qna.vo.UserNewQnaVO;

/**
 * @제목 : 제품 등록 서비스
 * @패키지이름 : com.nemo.user.customer.qna.service
 * @파일이름 : InsertQnaService.java
 * @작성일 : 2020. 8. 14
 * @이름 : Yerin
 * @프로그램설명 : QNA 등록 서비스 인터페이스
 * 
 */

public interface InsertQnaService {
	public int insertQna(UserNewQnaVO vo);

}
