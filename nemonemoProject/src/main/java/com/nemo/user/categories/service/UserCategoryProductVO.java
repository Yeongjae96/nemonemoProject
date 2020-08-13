package com.nemo.user.categories.service;

import java.util.List;
import java.util.Map;

import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.Data;

@Data
public class UserCategoryProductVO {
	
	private List<UserBaseProductsCategoryVO> productCategoryList;
	private List<UserBaseProductsVO> productList;
	private Map<String, UserBaseProductsImageVO> productPresentiveImageList;
	
}
