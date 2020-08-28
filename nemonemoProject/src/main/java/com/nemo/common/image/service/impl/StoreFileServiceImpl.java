package com.nemo.common.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.image.service.StoreFileService;
import com.nemo.user.store.repository.impl.StoreImageMapper;
import com.nemo.user.store.vo.StoreImageVO;

@Service
public class StoreFileServiceImpl implements StoreFileService {
	
	@Autowired
	private StoreImageMapper storeImageMapper;
	
	@Override
	public StoreImageVO getFile(int storeImgNo) {
		StoreImageVO imageVO = storeImageMapper.selectImage(storeImgNo);
		return imageVO;
	}
}
