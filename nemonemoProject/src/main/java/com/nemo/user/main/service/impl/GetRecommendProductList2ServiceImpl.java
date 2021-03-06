package com.nemo.user.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.main.respository.impl.MainMapper;
import com.nemo.user.main.service.GetRecommendProductList2Service;
import com.nemo.user.main.service.GetRecommendProductListService;
import com.nemo.user.main.vo.RecommendProductVO;

@Service
public class GetRecommendProductList2ServiceImpl implements GetRecommendProductList2Service{

	@Autowired
	private MainMapper mainDAO;

	@Override
	public List<RecommendProductVO> getRecommendProductList2() {
		return mainDAO.getRecommendProductList2();
	}
}
