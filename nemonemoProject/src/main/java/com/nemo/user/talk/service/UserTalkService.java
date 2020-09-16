package com.nemo.user.talk.service;

import java.util.Map;

import com.nemo.user.talk.vo.UserTalkContactParamVO;
import com.nemo.user.talk.vo.UserTalkContactResVO;
import com.nemo.user.talk.vo.UserTalkListResVO;
import com.nemo.user.talk.vo.UserTalkMsgListResVO;

public interface UserTalkService {
	
	public UserTalkContactResVO getContactVO(UserTalkContactParamVO vo);
	public UserTalkListResVO getTalkListVO();
	public UserTalkMsgListResVO getTalkMsgListVO(int opponentUserNo);
	public int createTalk(int opponentUserNo);
	
	public int exitTalk(Map<String, Object> param);
}
