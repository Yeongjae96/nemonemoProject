package com.nemo.admin.members.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nemo.admin.members.qna.repository.impl.QnaMapper;
import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public List<AdminBaseQnaVO> getQnaList(AdminBaseQnaVO vo) {
		return qnaMapper.getQnaList(vo);
	}
	@Override
	public AdminBaseQnaVO getQna(AdminBaseQnaVO vo) {
		return qnaMapper.getQna(vo);
	}

}
