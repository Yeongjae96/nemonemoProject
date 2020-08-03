package com.nemo.admin.sites.faq.repository.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.sites.faq.repository.IFaqCategoryMapper;

@Mapper
public interface FaqCategoryMapper extends IFaqCategoryMapper {
	
	public int useFlagUpdate(Map<String, Object> useFlagUpdateParamMap);
}
