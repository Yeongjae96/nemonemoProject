package com.nemo.user.products.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserSelectedProductVO {
	private UserBaseProductsVO productVO;
	private UserBaseProductsCategoryVO productCateVO;
	private List<UserBaseProductsImageVO> productImgList;
}
