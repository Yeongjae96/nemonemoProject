package com.nemo.user.talk.vo;

import java.util.List;

import com.nemo.common.constraints.ResponseResult;

import lombok.Data;

@Data
public class UserTalkMsgListResVO {
	
	private String result;
	private int currentUserNo;
	private int talkNo;
	private int opponentUserNo;
	private int productCnt;
	private int storeRating;
	private int storeReviewCnt;
	private int receiverImgNo;
	private String storeName;
	private List<UserBaseMsgVO> msgList;
}
