package com.nemo.user.customer.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.service.CustomerQnaCategoryService;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;

@Service
public class CustomerQnaCategoryServiceImpl implements CustomerQnaCategoryService{
	
	@Autowired
	private CustomerQnaMapper customerQnaMapper;

	@Override
	public List<UserBaseQnaCategoryVO> getQnaCategoryNameList(UserBaseQnaCategoryVO vo) {
		List<UserBaseQnaCategoryVO> qnaCategoryNameList = customerQnaMapper.getQnaCategoryNameList();
		System.out.println(qnaCategoryNameList);
		return qnaCategoryNameList;
	}
	
	public List<UserBaseQnaCategoryVO> getQnaCategoryList(UserBaseQnaCategoryVO vo) {
		return customerQnaMapper.getQnaCategoryList();
	}
	

}
