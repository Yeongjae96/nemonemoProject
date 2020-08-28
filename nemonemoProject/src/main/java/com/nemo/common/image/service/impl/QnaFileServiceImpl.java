package com.nemo.common.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.image.service.QnaFileService;
import com.nemo.user.customer.qna.repository.impl.QnaImageMapper;
import com.nemo.user.customer.qna.vo.UserBaseQnaImageVO;

@Service
public class QnaFileServiceImpl implements QnaFileService{

	@Autowired
	private QnaImageMapper qnaImageMapper;
	
	@Override
	public UserBaseQnaImageVO getFile(int qnaImgNo) {
		UserBaseQnaImageVO imageVO = qnaImageMapper.selectImage(qnaImgNo);
		return imageVO;
	}
	

}
