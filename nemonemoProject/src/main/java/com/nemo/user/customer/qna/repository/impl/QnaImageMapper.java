package com.nemo.user.customer.qna.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.customer.qna.repository.IQnaImageMapper;
import com.nemo.user.customer.qna.vo.UserBaseQnaImageVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

@Mapper
public interface QnaImageMapper extends IQnaImageMapper{
	public List<UserBaseQnaImageVO> selectQnaImg(List<UserBaseQnaVO> list);

}
