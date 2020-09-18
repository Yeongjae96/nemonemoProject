package com.nemo.admin.statistics.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.statistics.repository.impl.StPdCategoryMapper;
import com.nemo.admin.statistics.service.StPdCategoryService;

@Service
public class StPdCategoryServiceImpl implements StPdCategoryService {
	
	@Autowired
	private StPdCategoryMapper stCateMapper;
	
	@Override
	public Map<String, Object> getLargeCategories() {
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("data", stCateMapper.selectLargeCategories());
		return response;
	}
	
}
