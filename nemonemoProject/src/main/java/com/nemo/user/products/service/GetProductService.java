package com.nemo.user.products.service;

import com.nemo.user.products.vo.UserGetProductVO;
import com.nemo.user.products.vo.UserRecentlyProductVO;

public interface GetProductService {
	public UserGetProductVO getProduct(int productNo);
	public UserRecentlyProductVO getRecentlyProductVO(int productNo);
}
