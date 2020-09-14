package com.nemo.user.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.main.respository.impl.MainMapper;
import com.nemo.user.main.service.GetPopularProductListService;
import com.nemo.user.main.vo.PopularProductVO;

@Service
public class GetPopularProductListServiceImpl implements GetPopularProductListService {

	@Autowired
	private MainMapper mainDAO;
	
	@Override
	public List<PopularProductVO> getPopularProductList() {
		return mainDAO.getPopularProductList();
	}
}
