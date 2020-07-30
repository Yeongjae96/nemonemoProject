package com.nemo.user.customer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.repository.CustomerDAO;
import com.nemo.user.customer.service.CustomerService;
import com.nemo.user.customer.vo.UserNoticeVO;

/**
 * @제목 : Customer Service 클래스
 * @패키지이름 : com.nemo.user.customer.service.impl
 * @파일이름 : CustomerServiceImpl.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : Customer 요청에 대한 서비스
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------			-------------	
 * 20.07.30		김영재				customer 초기설정
 */
@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDAO customerDAO;
	
	@Override
	public List<UserNoticeVO> getNoticeList() {
		return customerDAO.getNoticeList()	;
	}
}
