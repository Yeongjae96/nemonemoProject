package com.nemo.user.talk.repository.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.talk.repository.IUserTalkMapper;
import com.nemo.user.talk.vo.UserTalkContactResVO;

@Mapper
public interface UserTalkMapper extends IUserTalkMapper{
	
	public UserTalkContactResVO selectContactVO(Map<String, Object> paramMap);
}
