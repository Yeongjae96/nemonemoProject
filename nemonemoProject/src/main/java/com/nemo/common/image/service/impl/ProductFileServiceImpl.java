package com.nemo.common.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.nemo.common.image.service.ProductFileService;
import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.vo.UserBaseProductsImageVO;

@Service
public class ProductFileServiceImpl implements ProductFileService {
	
	@Autowired
	private ProductsImageMapper productsImageMapper;
	
	@Override
	public UserBaseProductsImageVO getFile(int productImgNo) {
		UserBaseProductsImageVO imageVO = productsImageMapper.selectImage(productImgNo);
		return imageVO;
	}
}
