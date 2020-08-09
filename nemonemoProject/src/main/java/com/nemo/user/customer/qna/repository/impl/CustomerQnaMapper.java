package com.nemo.user.customer.qna.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.customer.qna.repository.ICustomerQnaMapper;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

@Mapper
public interface CustomerQnaMapper extends ICustomerQnaMapper{
	
	/* 카테고리 */
	public List<UserBaseQnaCategoryVO> getQnaCategoryParentList();
	public List<UserBaseQnaCategoryVO> getQnaCategoryNameList();
	
		
}
