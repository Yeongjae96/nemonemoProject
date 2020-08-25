package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreCommentVO;

public interface GetStoreCommentListService {
	public List<StoreCommentVO> getStoreCommentList(int storeNo);
}
