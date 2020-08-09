package com.nemo.user.customer.qna.service;

import java.util.List;

import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;

public interface CustomerQnaService {
	
	public List<UserBaseQnaCategoryVO> getQnaCategoryParentList(UserBaseQnaCategoryVO vo);
	public List<UserBaseQnaCategoryVO> getQnaCategoryNameList(UserBaseQnaCategoryVO vo);

}
