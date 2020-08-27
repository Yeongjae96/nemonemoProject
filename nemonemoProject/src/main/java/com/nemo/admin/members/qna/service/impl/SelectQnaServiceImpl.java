package com.nemo.admin.members.qna.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.qna.repository.impl.QnaMapper;
import com.nemo.admin.members.qna.service.SelectQnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

@Service
public class SelectQnaServiceImpl implements SelectQnaService{

	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public AdminBaseQnaVO getQna(int qnaNo) {
		return qnaMapper.getQna(qnaNo);
	}

}
