package com.nemo.user.customer.qna.repository;

import java.util.List;
import java.util.Map;

import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

public interface ICustomerQnaMapper {
	
	/* 카테고리 */
	public List<UserBaseQnaCategoryVO> getQnaCategoryNameList();
	public List<UserBaseQnaCategoryVO> getQnaCategoryList();
	
	/* QNA CRUD */
	public int insertQna(UserBaseQnaVO vo);
	public List<UserBaseQnaVO> selectQnaList(Map<String, Object> qnaMapperParamMap);
	
	public int selectQnaListFromUserNo(UserBaseQnaVO userBaseQnaVO);

}
