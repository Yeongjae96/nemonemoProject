package com.nemo.admin.products.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper=true)
public class AdminProductResponseVO extends AdminBaseProductsVO{
	
	private String productCateLarge;
	private String productCateMedium;
	private String productCateSmall;
}
