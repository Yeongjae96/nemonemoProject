package com.nemo.user.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.search.repository.impl.SearchTopKeywordMapper;
import com.nemo.user.search.service.SearchTopKeywordService;
import com.nemo.user.search.vo.UserBaseTopSearchedVO;

@Service
public class SearchTopKeywordServiceImpl implements SearchTopKeywordService{
	
	@Autowired
	private SearchTopKeywordMapper searchTopKeywordMapper;
	
	@Override
	public List<UserBaseTopSearchedVO> getSearchTopKeywordList() {
		return searchTopKeywordMapper.selectSearchTopKeyword();
	}
}
