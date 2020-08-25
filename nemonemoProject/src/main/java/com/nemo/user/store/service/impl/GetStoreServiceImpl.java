package com.nemo.user.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreService;
import com.nemo.user.store.vo.StoreVO;

@Service
public class GetStoreServiceImpl implements GetStoreService {

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public StoreVO getStore(int storeNo) {
		
		return storeDAO.getStore(storeNo);
	}
	
}
