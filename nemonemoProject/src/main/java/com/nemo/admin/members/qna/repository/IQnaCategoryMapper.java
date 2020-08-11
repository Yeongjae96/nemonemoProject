package com.nemo.admin.members.qna.repository;

import java.util.List;

import com.nemo.admin.members.qna.vo.QnaCategoryVO;

/**
 * @제목 : QNA 카테고리 테이블의 기본 매퍼
 * @패키지이름 : com.nemo.admin.sites.qna.repository
 * @파일이름 : IQnaCategoryMapper.java
 * @작성일 : 2020. 8. 8.
 * @이름 : Yerin
 * @프로그램설명 : QNA 카테고리 테이블의 기본 매퍼
 * 
 */

public interface IQnaCategoryMapper {
	public int insertQnaCategory(QnaCategoryVO vo);
	public int deleteQnaCategory(int qnaCategoryNo);
	public int updateQnaCategory(QnaCategoryVO vo);
	public QnaCategoryVO getQnaCategory(int qnaCategorySq);
	public List<QnaCategoryVO> getQnaCategoryList(String qnaCategoryUseFlMode);
	
}
