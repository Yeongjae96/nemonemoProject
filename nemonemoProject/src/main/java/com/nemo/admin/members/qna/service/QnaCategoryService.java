package com.nemo.admin.members.qna.service;

import java.util.List;

import com.nemo.admin.members.qna.vo.QnaCategoryVO;

/**
 * @제목 : FAQ 카테고리 CRUD 서비스
 * @패키지이름 : com.nemo.admin.sites.qna.service
 * @파일이름 : QnaCategoryService.java
 * @작성일 : 2020. 8. 8.
 * @이름 : Yerin
 * @프로그램설명 : QNA의 카테고리 기본적인 CRUD의 서비스 인터페이스
 *
 */

public interface QnaCategoryService {
	public int insertQnaCategory(QnaCategoryVO vo);
	public int deleteQnaCategory(int qnaCategoryNo);
	public int updateQnaCategory(QnaCategoryVO vo);
	public QnaCategoryVO getQnaCategory(int qnaCategoryNo);
	public List<QnaCategoryVO> getQnaCategoryList(String qnaCategoryUseFlMode);
}
