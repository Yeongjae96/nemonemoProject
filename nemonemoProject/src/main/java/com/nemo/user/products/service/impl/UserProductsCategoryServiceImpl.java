package com.nemo.user.products.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.service.UserProductsCategoryService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

@Service
public class UserProductsCategoryServiceImpl implements UserProductsCategoryService {
	
	@Autowired
	private UserProductsCategoryMapper userProductsMapper;
	
	@Override
	public List<UserBaseProductsCategoryVO> getAllCategoryList() {
		return userProductsMapper.getAllCategoryList();
	}
}
