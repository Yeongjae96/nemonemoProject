package com.nemo.user.talk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nemo.common.constraints.ResponseResult;
import com.nemo.common.util.AuthUtil;
import com.nemo.common.util.ContextUtil;
import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.talk.repository.impl.UserTalkMapper;
import com.nemo.user.talk.service.UserTalkService;
import com.nemo.user.talk.vo.UserBaseMsgVO;
import com.nemo.user.talk.vo.UserTalkContactParamVO;
import com.nemo.user.talk.vo.UserTalkContactResVO;
import com.nemo.user.talk.vo.UserTalkListResVO;
import com.nemo.user.talk.vo.UserTalkMsgListResVO;

@Service
public class UserTalkServiceImpl implements UserTalkService {

	@Autowired
	private UserTalkMapper userTalkMapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public UserTalkContactResVO getContactVO(UserTalkContactParamVO vo) {
		
		// 0. 세션에 담긴 userNo를 갖고 온다.
		
		int myUserNo = getMyUserNo();
		if(myUserNo == -1 ) return null;
		int opponentUserNo = vo.getUserOpponentNo();

		// 1. 두 사람의 userNo를 나열한다. ( 작은수 큰수 )
		int lowUserNo = myUserNo < opponentUserNo ? myUserNo : opponentUserNo;
		int highUserNo = myUserNo > opponentUserNo ? myUserNo : opponentUserNo;
		
		// 2. contactResVO 값을 구한다.
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("lowUserNo", lowUserNo);
		paramMap.put("highUserNo", highUserNo);
		paramMap.put("productNo", vo.getProductNo());
		
		UserTalkContactResVO result = userTalkMapper.selectContactVO(paramMap);
		List<UserBaseMsgVO> msgList = userTalkMapper.selectMsgListByUserNo(paramMap); 
		result.setCurrentUserNo(myUserNo);
		result.setMsgList(msgList);
		result.setResult("success");
		return result;
	}

	@Override
	public int createTalk(int opponentUserNo) {
		
		// 작은수 큰수 나열하여 방을 만든다.
		Map<String, Object> paramMap = new HashMap<>();
 		int myUserNo = getMyUserNo();
 		if(myUserNo == -1 ) return myUserNo;
 		
		int lowUserNo = getMyUserNo() < opponentUserNo ? getMyUserNo() : opponentUserNo;
		int highUserNo = getMyUserNo() > opponentUserNo ? getMyUserNo() : opponentUserNo;
		
		paramMap.put("lowUserNo", lowUserNo);
		paramMap.put("highUserNo", highUserNo);
		
		return userTalkMapper.insertTalk(paramMap);
	}
	
	private int getMyUserNo() {
		UserBaseVO myUser = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		return myUser == null ? -1 : myUser.getUserNo();
	}
	
	@Override
	public UserTalkListResVO getTalkListVO() {
		
		UserTalkListResVO result = new UserTalkListResVO();
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		if(user == null) {
			result.setResult("fail:login");
			return result;
		}
		
		result.setResult("success");
		result.setData(userTalkMapper.selectMyTalkList(user.getUserNo()));
		result.setCurrentUserNo(user.getUserNo());
		return result;
	}
	
	
	@Override
	public UserTalkMsgListResVO getTalkMsgListVO(int opponentUserNo) {
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		
		if(user == null) {
			UserTalkMsgListResVO result = new UserTalkMsgListResVO();
			result.setResult(AuthUtil.getResponseStatus(ResponseResult.LOGIN_FAIL));
			return result;
		}
		
		int lowUserNo = user.getUserNo() < opponentUserNo ? user.getUserNo() : opponentUserNo;
		int highUserNo = user.getUserNo() > opponentUserNo ? user.getUserNo() : opponentUserNo;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("lowUserNo", lowUserNo);
		paramMap.put("highUserNo", highUserNo);
		paramMap.put("opponentUserNo", opponentUserNo);
		
		UserTalkMsgListResVO result = userTalkMapper.selectTalkMsgResVO(paramMap);
		List<UserBaseMsgVO> msgList = userTalkMapper.selectMsgListByUserNo(paramMap);
		
		result.setResult(AuthUtil.getResponseStatus(ResponseResult.SUCCESS));
		result.setCurrentUserNo(AuthUtil.getCurrentUserNo());
		result.setOpponentUserNo(opponentUserNo);
		result.setMsgList(msgList);
		
		return result;
	}
	
}
