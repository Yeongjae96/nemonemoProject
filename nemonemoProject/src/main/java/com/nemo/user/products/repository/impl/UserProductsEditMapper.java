package com.nemo.user.products.repository.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.repository.IUserProductsEditMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserNewProductsVO;
import com.nemo.user.products.vo.UserProductsEditDispVO;
import com.nemo.user.products.vo.UserProductsEditVO;

@Mapper
public interface UserProductsEditMapper extends IUserProductsEditMapper {
	
	public UserProductsEditVO getProductEditVO(int productNo);
	public List<UserBaseProductsCategoryVO> getProductCateList(Map<String, Object> paramMap);
	public int editProduct(UserNewProductsVO vo);
	public int editProductDisp(UserProductsEditDispVO vo);
}
