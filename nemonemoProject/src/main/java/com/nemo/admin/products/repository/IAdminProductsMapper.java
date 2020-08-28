package com.nemo.admin.products.repository;

import java.util.List;

import com.nemo.admin.products.vo.AdminProductResponseVO;

public interface IAdminProductsMapper {
	public List<AdminProductResponseVO> getProductList(String disp);
	

}
