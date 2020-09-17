package com.nemo.user.store.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.store.repository.IStoreImageMapper;
import com.nemo.user.store.vo.StoreImageVO;
import com.nemo.user.store.vo.StoreVO;


/**
 * @제목 : 상점 이미지 DAO Mybatis Repository 
 * @패키지이름 : com.nemo.user.store.repository.impl
 * @파일이름 :StoreImageMapper.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 이미지 DAO Mybatis Repository 
 */
@Mapper
public interface StoreImageMapper extends IStoreImageMapper {
	public StoreImageVO selectPresentiveImg(List<StoreVO> list);

	
}
