package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreProductVO;

public interface GetStoreProductListService {
	public List<StoreProductVO> getStoreProductList(int storeNo);
}
