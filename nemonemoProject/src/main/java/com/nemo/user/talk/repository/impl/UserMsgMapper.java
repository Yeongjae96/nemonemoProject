package com.nemo.user.talk.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.talk.repository.IUserMsgMapper;
import com.nemo.user.talk.vo.UserBaseMsgVO;

@Mapper
public interface UserMsgMapper extends IUserMsgMapper{
	
	public int updateConfirmSt(UserBaseMsgVO vo);
}
