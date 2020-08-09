package com.nemo.admin.products.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.products.repository.IProductsCategoryMapper;
import com.nemo.admin.products.vo.AdminBaseProductsCategoryVO;

@Mapper
public interface ProductsCategoryMapper extends IProductsCategoryMapper{
	public List<AdminBaseProductsCategoryVO> getCategoryList(AdminBaseProductsCategoryVO vo);
}
