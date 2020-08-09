package com.nemo.admin.members.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.qna.repository.impl.QnaCategoryMapper;
import com.nemo.admin.members.qna.service.QnaCategoryService;
import com.nemo.admin.members.qna.vo.QnaCategoryVO;

@Service
public class QnaCategoryServiceImpl implements QnaCategoryService {

	@Autowired
	private QnaCategoryMapper qnaCategoryMapper;

	@Override
	public List<QnaCategoryVO> getQnaCategoryList(String qnaCategoryUseFlMode) {
		return qnaCategoryMapper.getQnaCategoryList(qnaCategoryUseFlMode);
	}

	@Override
	public int insertQnaCategory(QnaCategoryVO vo) {
// 중복확인 어케하지.. 
//		if(qnaCategoryMapper.checkCategoryName(vo.getQnaCategoryName()) == 1)
		return qnaCategoryMapper.insertQnaCategory(vo);
	}

	@Override
	public QnaCategoryVO getQnaCategory(int qnaCategorySq) {
		return qnaCategoryMapper.getQnaCategory(qnaCategorySq);
	}

	@Override
	public int updateQnaCategory(QnaCategoryVO vo) {
		return qnaCategoryMapper.updateQnaCategory(vo);
	}

	@Override
	public int deleteQnaCategory(int qnaCategoryNo) {
		return qnaCategoryMapper.deleteQnaCategory(qnaCategoryNo);
	}

}
