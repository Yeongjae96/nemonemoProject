package com.nemo.user.store.repository;

import com.nemo.user.store.vo.StoreImageVO;

public interface IStoreImageMapper {
	
	public int insertStoreImage(StoreImageVO vo);
	public int updateStoreImage(StoreImageVO vo);
	public StoreImageVO selectImage(int storeImgNo);
	
}
