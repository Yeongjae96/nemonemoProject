package com.nemo.user.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.repository.IProductsImageMapper;
import com.nemo.user.products.vo.UserBaseProductsImageVO;

@Mapper
public interface ProductsImageMapper extends IProductsImageMapper {
	
	public int insertImage(List<UserBaseProductsImageVO> voList);
	
}
