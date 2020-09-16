package com.nemo.user.store.service;

import java.util.List;

import com.nemo.user.store.vo.StoreFavoriteVO;


/**
 * @제목 : 상점 찜 리스트 조회 서비스
 * @패키지이름 : com.nemo.user.store.service
 * @파일이름 :GetStoreFavoriteListService.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 찜 리스트 조회 서비스
 */
public interface GetStoreFavoriteListService {
	public List<StoreFavoriteVO> getStoreFavoriteList(int storeNo);
	public int getJjimCount(int storeNo);
}
