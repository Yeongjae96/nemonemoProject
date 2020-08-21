package com.nemo.admin.members.qna.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.qna.repository.impl.QnaMapper;
import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaImageVO;
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
	public int replyQna(AdminBaseQnaVO vo) {
		vo.setQnaReplyYmd(new Date(System.currentTimeMillis()));
		return qnaMapper.replyQna(vo);
	}
	
	@Override
	public List<AdminBaseQnaImageVO> selectImageList(int qnaNo) throws Exception {
		return qnaMapper.selectImageList(qnaNo);
	}
	
//	@Override
//	public AdminBaseQnaVO getQna(int qnaNo) {
//		return qnaMapper.getQna(qnaNo);
//	}

}
