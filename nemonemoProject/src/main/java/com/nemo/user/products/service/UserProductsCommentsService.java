package com.nemo.user.products.service;

import com.nemo.user.products.vo.ProductsCommentsVO;

public interface UserProductsCommentsService {
	public int insertProductComment(ProductsCommentsVO vo);
	public int deleteProductComment(ProductsCommentsVO vo);
}
