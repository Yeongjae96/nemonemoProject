package com.nemo.user.products.service;

import java.util.List;

import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

public interface UserProductsRestService {
	public List<UserBaseProductsCategoryVO> getAllCategoryList();
}
