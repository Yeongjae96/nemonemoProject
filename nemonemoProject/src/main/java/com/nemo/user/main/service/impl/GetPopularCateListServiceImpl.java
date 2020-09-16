package com.nemo.user.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.main.respository.impl.MainMapper;
import com.nemo.user.main.service.GetPopularCateListService;
import com.nemo.user.main.vo.PopularCateVO;

@Service
public class GetPopularCateListServiceImpl implements GetPopularCateListService {
	@Autowired
	private MainMapper mainDAO;
	
	@Override
	public List<PopularCateVO> getPopularCateList() {
		return mainDAO.getPopularCateList();
	}
}
