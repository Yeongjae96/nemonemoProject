package com.nemo.user.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.repository.IUserProductsCategoryMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

@Mapper
public interface UserProductsCategoryMapper extends IUserProductsCategoryMapper {
	
	public List<UserBaseProductsCategoryVO> getAllCategoryList();
}
