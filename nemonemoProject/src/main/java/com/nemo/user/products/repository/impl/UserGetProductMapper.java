package com.nemo.user.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserSelectedProductVO;

@Mapper
public interface UserGetProductMapper {
	public UserSelectedProductVO selectProductFromPdSeq(int productNo);
	public List<UserBaseProductsImageVO> selectImgListFromPdSeq(int productNo);
}
