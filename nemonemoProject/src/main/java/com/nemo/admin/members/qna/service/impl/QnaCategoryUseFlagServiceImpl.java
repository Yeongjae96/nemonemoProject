package com.nemo.admin.members.qna.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.qna.repository.impl.QnaCategoryMapper;
import com.nemo.admin.members.qna.service.QnaCategoryUseFlagService;

@Service
public class QnaCategoryUseFlagServiceImpl implements QnaCategoryUseFlagService{

	@Autowired
	private QnaCategoryMapper qnaCategoryMapper;
	
	@Override
	public int updateUseFlag(Map<String, Object> useFlagUpdateParamMap) {
		return qnaCategoryMapper.useFlagUpdate(useFlagUpdateParamMap);
	}

}
