package com.nemo.user.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreCommentListService;
import com.nemo.user.store.vo.StoreCommentVO;


@Service
public class GetStoreCommentListServiceImpl implements GetStoreCommentListService{

	@Autowired
	private StoreMapper storeDAO;

	@Override
	public List<StoreCommentVO> getStoreCommentList(int storeNo) {
		return storeDAO.getStoreCommentList(storeNo);
	}
	
	
}
