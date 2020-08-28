package com.nemo.user.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.DeleteStoreCommentService;



@Service
public class DeleteStoreCommentServiceImpl implements DeleteStoreCommentService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public int deleteStoreComment(int storeCommentNo) {
		return storeDAO.deleteStoreComment(storeCommentNo);
	}

}
