package com.nemo.user.talk.vo;

import lombok.Data;

@Data
public class UserMyTalkVO {
	private String storeName;
	private int storeImgNo;
	private int msgUnidCnt;
	private UserBaseMsgVO lastRecentlyMsgVO;
}
