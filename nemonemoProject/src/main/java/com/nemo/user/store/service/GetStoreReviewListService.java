package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreReviewVO;

public interface GetStoreReviewListService {
	public List<StoreReviewVO> getStoreReviewList(int storeNo);
}
