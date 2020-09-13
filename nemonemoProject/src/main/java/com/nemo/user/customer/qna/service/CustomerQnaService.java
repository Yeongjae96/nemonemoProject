package com.nemo.user.customer.qna.service;

import com.nemo.admin.members.qna.vo.UserQnaResVO;
import com.nemo.common.paging.PageVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

public interface CustomerQnaService {
	public UserQnaResVO selectQnaList (UserBaseQnaVO vo, PageVO pageVO);
}
