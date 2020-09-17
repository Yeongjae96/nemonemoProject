package com.nemo.user.talk.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserTalkListResVO {
	private String result;
	private List<UserMyTalkVO> data;
	private int currentUserNo;
	private int opponentUserNo;
}
