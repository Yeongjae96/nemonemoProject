package com.nemo.user.search.products.repository.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nemo.user.products.vo.UserProductsCategoryCntVO;
import com.nemo.user.search.products.repository.ISearchProductsMapper;
import com.nemo.user.search.products.vo.UserPdPdImgVO;

@Mapper
public interface SearchProductsMapper extends ISearchProductsMapper {
		
	public List<UserPdPdImgVO> pdPdImgByKeyword(Map<String, Object> paramMap);
	public List<UserProductsCategoryCntVO> pdCateByKeyword(Map<String, Object> cateParamMap);
	public int allProductCntByKeyword(@Param("keyword") String keyword);
	
	public List<String> selectProductNameByKeyword(String keyword);
}
