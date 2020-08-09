package com.nemo.admin.products.repository;

import java.util.List;

import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

public interface IProductsCategoryMapper {
	
	public int insertProductsCategory(AdminBaseProductsCategoryVO vo);
	public int updateProductsCategory(AdminBaseProductsCategoryVO vo);
	public int deleteProductsCategory(int productsCateNo);
	public AdminBaseProductsCategoryVO getProductsCategory(int productsCateNo);
	public List<AdminBaseProductsCategoryVO> getProductsCategoryList();

}
