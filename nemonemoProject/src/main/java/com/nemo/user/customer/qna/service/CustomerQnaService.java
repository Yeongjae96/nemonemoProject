package com.nemo.user.customer.qna.service;

import java.util.List;

import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

public interface CustomerQnaService {
	public List<UserBaseQnaVO> selectQnaList (UserBaseQnaVO vo);
}
