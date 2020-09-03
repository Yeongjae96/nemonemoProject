package com.nemo.user.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nemo.user.products.vo.UserProductsRecommendVO;

@Mapper
public interface UserProductsRecommendMapper {
	public List<UserProductsRecommendVO> getRecommendListByCateNo(@Param("categoryNo")int categoryNo, @Param("productNo")int productNo);
}
