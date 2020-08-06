package com.nemo.user.customer.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.customer.faq.vo.BaseUserFaqCategoryVO;
import com.nemo.user.customer.faq.vo.BaseUserFaqVO;
import com.nemo.user.customer.repository.ICustomerMapper;
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
@Mapper
public interface CustomerMapper extends ICustomerMapper{
	
	public List<UserNoticeVO> getNoticeList();
	public List<BaseUserFaqVO> getSelectFaqList(int faqCategoryNo);
	public List<BaseUserFaqCategoryVO> getFaqCategoryList();
	public int getFaqCategoryStartNum();
}
