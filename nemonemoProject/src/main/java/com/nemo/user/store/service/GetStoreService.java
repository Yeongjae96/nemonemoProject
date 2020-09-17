package com.nemo.user.store.service;

import com.nemo.user.store.vo.StoreVO;


/**
 * @제목 : 상점 정보 조회 서비스
 * @패키지이름 : com.nemo.user.store.service
 * @파일이름 :GetStoreService.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 정보 조회 서비스
 */
public interface GetStoreService {
	public StoreVO getStore(int storeNo);
}
