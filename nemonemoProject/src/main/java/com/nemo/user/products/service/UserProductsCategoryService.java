package com.nemo.user.products.service;

import java.util.List;

import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

public interface UserProductsCategoryService {
	public List<UserBaseProductsCategoryVO> getAllCategoryList();
}
