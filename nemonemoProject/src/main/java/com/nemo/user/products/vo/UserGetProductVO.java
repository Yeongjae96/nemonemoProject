package com.nemo.user.products.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class UserGetProductVO {
	private UserSelectedProductVO selectedProduct;
	private UserGetSellerVO productSellerVO;
	private Map<String, List<UserBaseProductsCategoryVO>> categoryMap;
	private List<Map<String, Object>> commentList;
	private List<UserBaseProductsFavoriteVO> favoriteList;
	private List<UserProductsRecommendVO> recommendList;
}
