package com.nemo.user.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.UpdateStoreService;
import com.nemo.user.store.vo.StoreVO;



@Service
public class UpdateStoreServiceImpl implements UpdateStoreService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public int updateStore(StoreVO vo) {
		return storeDAO.updateStore(vo);
	}
}
