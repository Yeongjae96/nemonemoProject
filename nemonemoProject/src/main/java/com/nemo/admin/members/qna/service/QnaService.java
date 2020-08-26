package com.nemo.admin.members.qna.service;

import java.util.List;

import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

/**
 * @제목 : Qna 서비스
 * @패키지이름 : com.nemo.admin.members.qna.service
 * @파일이름 : QnaService.java
 * @작성일 : 2020. 8. 7.
 * @이름 : Yerin
 * @프로그램설명 : QNA 테이블의 간단한 CRUD 서비스 인터페이스
 * 
 */

public interface QnaService {	
	//public int insertQna(UserBaseQnaVO vo);
	//public int updateQna(UserBaseQnaVO vo);
	public List<AdminBaseQnaVO> getQnaList(AdminBaseQnaVO vo);
	public AdminBaseQnaVO getQna(AdminBaseQnaVO vo);

}
