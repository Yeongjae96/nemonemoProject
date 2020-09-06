package com.nemo.user.talk.service;

import com.nemo.user.talk.vo.UserTalkContactParamVO;
import com.nemo.user.talk.vo.UserTalkContactResVO;

public interface UserTalkService {
	
	public UserTalkContactResVO getContactVO(UserTalkContactParamVO vo);
	public int createTalk(int opponentUserNo);
}
