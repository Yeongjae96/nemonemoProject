package com.nemo.user.talk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.talk.repository.impl.UserMsgMapper;
import com.nemo.user.talk.service.UserMsgService;
import com.nemo.user.talk.vo.UserBaseMsgVO;

@Service
public class UserMsgServiceImpl implements UserMsgService{
	
	@Autowired
	private UserMsgMapper userMsgMapper;
	
	@Override
	public boolean recordMessage(UserBaseMsgVO vo) {
		return userMsgMapper.insertUserMsg(vo) == 1 ? true : false;
	}
	
	@Override
	public int confirmMsg(UserBaseMsgVO vo) {
		return userMsgMapper.updateConfirmSt(vo);
	}
	
}
