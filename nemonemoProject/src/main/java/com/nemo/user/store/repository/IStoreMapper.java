package com.nemo.user.store.repository;

import java.util.List;

import com.nemo.user.store.vo.StoreCommentVO;
import com.nemo.user.store.vo.StoreFavoriteVO;
import com.nemo.user.store.vo.StoreProductDispStVO;
import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreReviewVO;
import com.nemo.user.store.vo.StoreVO;

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
}
