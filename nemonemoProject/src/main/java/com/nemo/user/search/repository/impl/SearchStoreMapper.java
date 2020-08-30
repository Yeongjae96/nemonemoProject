package com.nemo.user.search.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.search.repository.ISearchStoreMapper;
import com.nemo.user.search.vo.UserSearchStoreResVO;
import com.nemo.user.search.vo.UserSearchStoreVO;

@Mapper
public interface SearchStoreMapper extends ISearchStoreMapper {
	public List<UserSearchStoreVO> selectSearchStoreByKeyword(String keyword);
	public int selectSearchStoreCntByKeyword(String keyword);

}
