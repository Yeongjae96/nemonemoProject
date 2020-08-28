package com.nemo.user.products.service;

import java.util.Map;

import com.nemo.user.products.vo.UserProductsManageResVO;

public interface UserProductsManageService {
	public UserProductsManageResVO getAllUserProducts(Map<String, Object> manageParamMap);
}
