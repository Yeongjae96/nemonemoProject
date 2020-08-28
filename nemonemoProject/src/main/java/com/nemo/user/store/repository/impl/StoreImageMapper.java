package com.nemo.user.store.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.store.repository.IStoreImageMapper;
import com.nemo.user.store.vo.StoreImageVO;
import com.nemo.user.store.vo.StoreVO;

@Mapper
public interface StoreImageMapper extends IStoreImageMapper {
	public StoreImageVO selectPresentiveImg(List<StoreVO> list);

	
}
