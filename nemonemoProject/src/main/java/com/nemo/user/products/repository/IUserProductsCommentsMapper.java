package com.nemo.user.products.repository;

import com.nemo.user.products.vo.ProductsCommentsVO;

public interface IUserProductsCommentsMapper {
	
	public int insertProductComment(ProductsCommentsVO vo);
	public int deleteProductComment(ProductsCommentsVO vo);
}
