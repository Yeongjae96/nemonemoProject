package com.nemo.user.customer.service;

import java.util.List;

import com.nemo.user.customer.vo.UserNoticeVO;


/**
 * @제목 : Customer Servcie 인터페이스
 * @패키지이름 : com.nemo.user.customer.service
 * @파일이름 : CustomerService.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : Customer 요청에 대한 Service 인터페이스
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------			-------------	
 * 20.07.30		김영재				customer 초기설정
 */
public interface CustomerService {
	public List<UserNoticeVO> getNoticeList();
}
