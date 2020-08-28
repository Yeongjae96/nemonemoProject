package com.nemo.user.customer.qna.repository;

import java.util.List;

import com.nemo.user.customer.qna.vo.UserBaseQnaImageVO;

public interface IQnaImageMapper {
	
	public int insertImage(List<UserBaseQnaImageVO> voList);
	public UserBaseQnaImageVO selectImage(int qnaImgNo);

}
