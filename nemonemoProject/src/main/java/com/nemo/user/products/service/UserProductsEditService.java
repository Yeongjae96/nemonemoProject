package com.nemo.user.products.service;

import com.nemo.user.products.vo.UserNewProductsVO;
import com.nemo.user.products.vo.UserProductsEditVO;

public interface UserProductsEditService {
	public UserProductsEditVO getEditVO(int productNo);
	public int editProduct(UserNewProductsVO vo);
}
