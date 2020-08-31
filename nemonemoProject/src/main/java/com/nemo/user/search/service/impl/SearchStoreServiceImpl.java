package com.nemo.user.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.search.repository.impl.SearchStoreMapper;
import com.nemo.user.search.service.SearchStoreService;
import com.nemo.user.search.vo.UserSearchStoreResVO;
import com.nemo.user.search.vo.UserSearchStoreVO;

@Service
public class SearchStoreServiceImpl implements SearchStoreService {
	
	@Autowired
	private SearchStoreMapper searchStoreMapper;
	
	@Override
	public UserSearchStoreResVO searchStoreList(String keyword) {
		
		UserSearchStoreResVO result = new UserSearchStoreResVO();
		
		// 상품의 총 갯수
		int storeCnt = searchStoreMapper.selectSearchStoreCntByKeyword(keyword);
		result.setStoreCnt(storeCnt);
		
		// 페이징 처리된 상점 정보들
		List<UserSearchStoreVO> searchStoreList = searchStoreMapper.selectSearchStoreByKeyword(keyword);
		result.setSearchStoreList(searchStoreList);
		
		return result;
	}
}
