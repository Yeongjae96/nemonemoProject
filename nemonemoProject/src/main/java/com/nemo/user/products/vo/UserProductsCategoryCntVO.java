package com.nemo.user.products.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class UserProductsCategoryCntVO extends UserBaseProductsCategoryVO {
	private int productCateCnt;
}
