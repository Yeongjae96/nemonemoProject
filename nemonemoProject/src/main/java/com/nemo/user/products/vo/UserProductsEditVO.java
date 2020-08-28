package com.nemo.user.products.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class UserProductsEditVO {
	private UserBaseProductsVO productVO;
	private UserBaseProductsCategoryVO productCateVO;
	private List<UserBaseProductsImageVO> productImgList;
	private Map<String, List<UserBaseProductsCategoryVO>> cateMap;
}
