package com.nemo.user.store.repository;

import java.util.List;

import com.nemo.user.store.vo.StoreCommentVO;
import com.nemo.user.store.vo.StoreFavoriteVO;
import com.nemo.user.store.vo.StoreProductDispStVO;
import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreReviewVO;
import com.nemo.user.store.vo.StoreVO;


/**
 * @제목 : 상점 DAO Interface
 * @패키지이름 : com.nemo.user.store.repository
 * @파일이름 :IStoreMapper.java
 * @작성일 : Sep 5, 2020
 * @이름 : Hyein
 * @프로그램설명 : 상점 DAO Interface
 */
public interface IStoreMapper {
	public StoreVO getStore(int storeNo);
	public List<StoreProductVO> getStoreProductList(int storeNo);
	public int updateStore(StoreVO vo);
	public List<StoreCommentVO> getStoreCommentList(int storeNo);
	public int insertStoreComment(StoreCommentVO vo);
	public List<StoreReviewVO> getStoreReviewList(int storeNo);
	public List<StoreFavoriteVO> getStoreFavoriteList(int storeNo);
	public int deleteStoreComment(int storeCommentNo);
	public List<StoreProductDispStVO> getStoreProductDispStList(int storeNo);
	public int getJjimCount(int storeNo);
}
