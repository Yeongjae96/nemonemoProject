package com.nemo.admin.members.qna.repository;

/**
 * @제목 : QNA 테이블의 기본 매퍼
 * @패키지이름 : com.nemo.admin.members.qna.repository
 * @파일이름 : IMapper.java
 * @작성일 : 2020. 08. 07.
 * @이름 : Yerin
 * @프로그램설명 : QNA 테이블의 기본 CRUD에 관한 매퍼
 */

public interface IQnaMapper {
	public int insertQna();
	public int deleteQna();
	public int updateQna();

}
