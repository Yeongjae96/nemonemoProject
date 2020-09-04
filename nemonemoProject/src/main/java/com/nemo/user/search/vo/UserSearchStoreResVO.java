package com.nemo.user.search.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserSearchStoreResVO {
	private int storeCnt;
	private List<UserSearchStoreVO> searchStoreList;
}
