package com.nemo.user.customer.repository.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.user.customer.repository.CustomerDAO;
import com.nemo.user.customer.vo.UserNoticeVO;


/**
 * @제목 : Mybatis CustomerDAO 
 * @패키지이름 : com.nemo.user.customer.repository.impl
 * @파일이름 : CustomerDAOMybatis.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : Mybatis를 이용한 Customer 요청에 관한 DB 접근
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------			-------------	
 * 20.07.30		김영재				customer 초기설정
 */
@Repository
public class CustomerDAOMybatis implements CustomerDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<UserNoticeVO> getNoticeList() {
		return session.selectList("com.nemo.user.customer.repository.impl.CustomerDAOMybatis.getNoticeList");
	}
}
