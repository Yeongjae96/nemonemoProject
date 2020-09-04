package com.nemo.user.products.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserProductsRecommendVO {
	private int productNo;
	private int productImgNo;
	private String productName;
	private int productPrice;
}
