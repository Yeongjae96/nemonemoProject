package com.nemo.user.customer.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.service.CustomerQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;

@Service
public class CustomerQnaServiceImpl implements CustomerQnaService{
	
	@Autowired
	private CustomerQnaMapper customerQnaMapper;

	@Override
	public List<UserBaseQnaCategoryVO> getQnaCategoryParentList(UserBaseQnaCategoryVO vo) {
		List<UserBaseQnaCategoryVO> qnaCategoryParentList = customerQnaMapper.getQnaCategoryParentList();
		System.out.println(qnaCategoryParentList);
		return qnaCategoryParentList;
	}

	@Override
	public List<UserBaseQnaCategoryVO> getQnaCategoryNameList(UserBaseQnaCategoryVO vo) {
		List<UserBaseQnaCategoryVO> qnaCategoryNameList = customerQnaMapper.getQnaCategoryNameList();
		System.out.println(qnaCategoryNameList);
		return qnaCategoryNameList;
	}
	

}
