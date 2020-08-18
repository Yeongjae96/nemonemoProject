package com.nemo.user.search.products.vo;

import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.Data;

@Data
public class UserPdPdImgVO {
	private UserBaseProductsVO productVO;
	private UserBaseProductsImageVO productImgVO;
}
