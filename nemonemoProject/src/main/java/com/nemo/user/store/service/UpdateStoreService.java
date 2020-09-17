package com.nemo.user.store.service;

import com.nemo.user.store.vo.StoreVO;
import com.nemo.user.store.vo.UserNewStoreVO;


/**
 * @제목 : 상점 정보 수정 서비스
 * @패키지이름 : com.nemo.user.store.service
 * @파일이름 :UpdateStoreService.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 정보 수정 서비스
 */
public interface UpdateStoreService {
	public int updateStore(UserNewStoreVO vo);
}
