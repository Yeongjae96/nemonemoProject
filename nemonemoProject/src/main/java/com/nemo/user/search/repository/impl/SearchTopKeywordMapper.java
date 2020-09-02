package com.nemo.user.search.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.search.vo.UserBaseTopSearchedVO;

@Mapper
public interface SearchTopKeywordMapper {
	public List<UserBaseTopSearchedVO> selectSearchTopKeyword();
	public int insertSearchKeyword(UserBaseTopSearchedVO vo);
}
