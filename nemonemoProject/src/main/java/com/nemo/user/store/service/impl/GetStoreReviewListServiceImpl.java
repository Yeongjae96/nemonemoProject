package com.nemo.user.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreReviewListService;
import com.nemo.user.store.vo.StoreReviewVO;

@Service
public class GetStoreReviewListServiceImpl implements GetStoreReviewListService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public List<StoreReviewVO> getStoreReviewList(int storeNo) {
		return storeDAO.getStoreReviewList(storeNo);
	}

}
