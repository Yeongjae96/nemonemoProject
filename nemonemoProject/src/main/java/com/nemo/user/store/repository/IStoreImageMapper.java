package com.nemo.user.store.repository;

import com.nemo.user.store.vo.StoreImageVO;


/**
 * @제목 : 상점 사진 DAO Interface
 * @패키지이름 : com.nemo.user.store.repository
 * @파일이름 :IStoreImageMapper.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 사진 DAO Interface
 */
public interface IStoreImageMapper {
	
	public int insertStoreImage(StoreImageVO vo);
	public int updateStoreImage(StoreImageVO vo);
	public StoreImageVO selectImage(int storeImgNo);
	
}
