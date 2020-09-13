package com.nemo.user.talk.repository;

import java.util.List;
import java.util.Map;

import com.nemo.user.talk.vo.UserBaseMsgVO;
import com.nemo.user.talk.vo.UserBaseTalkVO;
import com.nemo.user.talk.vo.UserMyTalkVO;

public interface IUserTalkMapper {
	public int insertTalk(Map<String, Object> paramMap);
	public int getTalkList(UserBaseTalkVO vo);
	public List<UserBaseMsgVO> selectMsgListByUserNo(Map<String, Object> paramMap);
	public List<UserMyTalkVO> selectMyTalkList(int userNo);
}
