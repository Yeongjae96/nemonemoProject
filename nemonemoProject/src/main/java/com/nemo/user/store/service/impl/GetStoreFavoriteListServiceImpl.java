package com.nemo.user.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreFavoriteListService;
import com.nemo.user.store.vo.StoreFavoriteVO;

@Service
public class GetStoreFavoriteListServiceImpl implements GetStoreFavoriteListService {
	
	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public List<StoreFavoriteVO> getStoreFavoriteList(int storeNo) {
		return storeDAO.getStoreFavoriteList(storeNo);
	}
	
}