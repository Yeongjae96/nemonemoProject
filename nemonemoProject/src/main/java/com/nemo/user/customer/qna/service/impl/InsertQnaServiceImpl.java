package com.nemo.user.customer.qna.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.service.InsertQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;


@Service
public class InsertQnaServiceImpl implements InsertQnaService{
	
	@Autowired
	private CustomerQnaMapper customerQnaMapper;

	@Override
	public int insertQna(UserBaseQnaVO vo) {
		vo.setQnaRegDate(new Date(System.currentTimeMillis()));
		return customerQnaMapper.insertQna(vo);
	}
	
	

}
