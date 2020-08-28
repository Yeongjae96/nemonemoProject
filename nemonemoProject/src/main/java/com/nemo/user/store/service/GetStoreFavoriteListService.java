package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreFavoriteVO;

public interface GetStoreFavoriteListService {
	public List<StoreFavoriteVO> getStoreFavoriteList(int storeNo);
}
