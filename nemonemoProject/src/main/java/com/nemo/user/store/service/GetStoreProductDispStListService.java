package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreProductDispStVO;

public interface GetStoreProductDispStListService {
	public List<StoreProductDispStVO> getStoreProductDispStList(int storeNo);
}
