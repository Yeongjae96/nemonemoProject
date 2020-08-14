package com.nemo.user.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreProductService;
import com.nemo.user.store.vo.StoreProductVO;

@Service
public class GetStoreProductServiceImpl implements GetStoreProductService {
	
	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public StoreProductVO getStoreProduct(int userNo) {
		
		return storeDAO.getStoreProduct(userNo);
	}
}
