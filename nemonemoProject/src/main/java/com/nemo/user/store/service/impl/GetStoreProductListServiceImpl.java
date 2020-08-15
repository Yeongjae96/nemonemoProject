package com.nemo.user.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreProductListService;
import com.nemo.user.store.vo.StoreProductVO;

@Service
public class GetStoreProductListServiceImpl implements GetStoreProductListService {
	
	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public List<StoreProductVO> getStoreProductList(int storeNo) {
		return storeDAO.getStoreProductList(storeNo);
	}
	
	

}
