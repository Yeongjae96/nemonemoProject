package com.nemo.user.products.repository.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.products.repository.IUserProductsCategoryMapper;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;

@Mapper
public interface UserProductsCategoryMapper extends IUserProductsCategoryMapper {
	
	public List<UserBaseProductsCategoryVO> getAllCategoryList();
	public List<Integer> selectChildrenCateNums(Map<String, Object> map);
	public UserBaseProductsCategoryVO searchCateSeq(int productCateNo);
	public List<UserBaseProductsCategoryVO> selectTypeCategoryList(String productCateType);
}
