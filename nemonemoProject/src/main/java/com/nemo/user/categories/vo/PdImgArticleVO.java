package com.nemo.user.categories.vo;

import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.Data;

@Data
public class PdImgArticleVO {
	private UserBaseProductsVO productVO;
	private UserBaseProductsImageVO productImageVO;
}
