package com.nemo.user.products.repository;

import java.util.List;

import com.nemo.user.products.vo.UserBaseProductsImageVO;

public interface IProductsImageMapper {
	
	public int insertImage(List<UserBaseProductsImageVO> voList);
	public UserBaseProductsImageVO selectImage(int productImgNo);
	
}
