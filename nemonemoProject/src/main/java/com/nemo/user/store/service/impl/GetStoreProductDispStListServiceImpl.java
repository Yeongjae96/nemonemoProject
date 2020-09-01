package com.nemo.user.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.GetStoreProductDispStListService;
import com.nemo.user.store.vo.StoreProductDispStVO;

@Service
public class GetStoreProductDispStListServiceImpl implements GetStoreProductDispStListService {
	
	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public List<StoreProductDispStVO> getStoreProductDispStList(int storeNo) {
		return storeDAO.getStoreProductDispStList(storeNo);
	}
	
	

}
