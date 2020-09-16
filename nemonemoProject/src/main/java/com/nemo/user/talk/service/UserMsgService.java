package com.nemo.user.talk.service;

import com.nemo.user.talk.vo.UserBaseMsgVO;

public interface UserMsgService {
	public boolean recordMessage(UserBaseMsgVO vo);
	public int confirmMsg(UserBaseMsgVO vo);
	public int deleteMsg(UserBaseMsgVO vo);
}
