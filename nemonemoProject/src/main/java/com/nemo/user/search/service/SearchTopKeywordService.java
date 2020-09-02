package com.nemo.user.search.service;

import java.util.List;

import com.nemo.user.search.vo.UserBaseTopSearchedVO;

public interface SearchTopKeywordService {
	
	public List<UserBaseTopSearchedVO> getSearchTopKeywordList();
	
}
