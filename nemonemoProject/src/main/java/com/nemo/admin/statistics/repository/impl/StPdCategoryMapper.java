package com.nemo.admin.statistics.repository.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.statistics.repository.IStPdCategoryMapper;

@Mapper
public interface StPdCategoryMapper extends IStPdCategoryMapper {
	public List<Map<String, Object>> selectLargeCategories();
}
