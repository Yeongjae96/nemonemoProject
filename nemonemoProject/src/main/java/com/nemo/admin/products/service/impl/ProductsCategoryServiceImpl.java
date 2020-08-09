package com.nemo.admin.products.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.products.repository.impl.ProductsCategoryMapper;
import com.nemo.admin.products.service.ProductsCategoryService;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

@Service
public class ProductsCategoryServiceImpl implements ProductsCategoryService {
	
	@Autowired
	public ProductsCategoryMapper productsCategoryMapper;
	
	@Override
	public int insertProductCategory(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.insertProductsCategory(vo);
	}

	@Override
	public int updateProductCategory(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.updateProductsCategory(vo);
	}
	
	@Override
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo) {
		return productsCategoryMapper.getCategoryList(vo);
	}
}
