package com.nemo.user.talk.service.repository;

import com.nemo.user.talk.vo.UserBaseMsgVO;
import com.nemo.user.talk.vo.UserBaseTalkVO;

public interface IUserTalkMapper {
	public int insertTalk(UserBaseTalkVO vo);
	public int insertMsg(UserBaseMsgVO vo);
}
