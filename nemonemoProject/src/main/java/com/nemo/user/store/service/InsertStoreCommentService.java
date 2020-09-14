package com.nemo.user.store.service;

import com.nemo.user.store.vo.StoreCommentVO;


/**
 * @제목 : 상점 문의 등록 서비스 
 * @패키지이름 : com.nemo.user.store.service
 * @파일이름 :InsertStoreCommentService.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 문의 등록 서비스 
 */
public interface InsertStoreCommentService {
	public int insertStoreComment(StoreCommentVO vo);
}
