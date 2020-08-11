package com.nemo.admin.members.qna.repository.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.members.qna.repository.IQnaCategoryMapper;

/**
 * @제목 : QNA 카테고리 테이블의 매퍼
 * @패키지이름 : com.nemo.admin.memebers.qna.repository.impl
 * @파일이름 : QnaCategoryMapper.java
 * @작성일 : 2020. 8. 8
 * @이름 : Yerin
 * @프로그램설명 : QNA 카테고리 테이블의 매퍼
 */

@Mapper
public interface QnaCategoryMapper extends IQnaCategoryMapper {
	public int useFlagUpdate(Map<String, Object> useFlagUpdateParamMap);
	public int checkCategoryName(String qnaCategoryName);

}
