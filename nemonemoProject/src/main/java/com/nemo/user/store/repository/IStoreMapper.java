package com.nemo.user.store.repository;

import java.util.List;

import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreVO;

public interface IStoreMapper {
	public StoreVO getStore(int storeNo);
	public List<StoreProductVO> getStoreProductList(int storeNo);
	public int updateStore(StoreVO vo);
}
