package com.nemo.user.products.repository.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.repository.IUserProductsManageMapper;
import com.nemo.user.products.vo.UserProductsManageVO;

@Mapper
public interface UserProductsManageMapper extends IUserProductsManageMapper{
	
	public List<UserProductsManageVO> getAllUserProducts(Map<String, Object> manageMapperParamMap);
	
}
