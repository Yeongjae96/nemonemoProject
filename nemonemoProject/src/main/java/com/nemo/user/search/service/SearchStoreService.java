package com.nemo.user.search.service;

import java.util.List;

import com.nemo.user.search.vo.UserSearchStoreResVO;

public interface SearchStoreService {
	public UserSearchStoreResVO searchStoreList(String keyword);
	public List<String> searchStoreKeyword(String keyword);
}
