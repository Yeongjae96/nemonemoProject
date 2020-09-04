package com.nemo.user.talk.service;

import com.nemo.user.talk.vo.UserBaseMsgVO;

public interface UserTalkService {
	
	public int startTalk(UserBaseMsgVO vo);
	public int sendMsg(UserBaseMsgVO vo);
	public int endTalk(UserBaseMsgVO vo);
	
}
