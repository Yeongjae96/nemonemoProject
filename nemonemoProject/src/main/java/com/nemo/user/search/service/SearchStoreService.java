package com.nemo.user.search.service;

import com.nemo.user.search.vo.UserSearchStoreResVO;

public interface SearchStoreService {
	public UserSearchStoreResVO searchStoreList(String keyword);
}
