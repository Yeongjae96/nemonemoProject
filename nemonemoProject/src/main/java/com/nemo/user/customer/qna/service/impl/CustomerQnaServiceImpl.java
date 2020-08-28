package com.nemo.user.customer.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.service.CustomerQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

@Service
public class CustomerQnaServiceImpl implements CustomerQnaService {

	@Autowired
	private CustomerQnaMapper customerQnaMapper;

	@Override
	public List<UserBaseQnaVO> selectQnaList(UserBaseQnaVO vo) {
		return customerQnaMapper.selectQnaList(vo);
	}

}
