package com.nemo.user.store.repository;

import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreVO;

public interface IStoreMapper {
	public StoreVO getStore(int storeNo);
	public StoreProductVO getStoreProduct(int userNo);
	public int updateStore(StoreVO vo);
}
