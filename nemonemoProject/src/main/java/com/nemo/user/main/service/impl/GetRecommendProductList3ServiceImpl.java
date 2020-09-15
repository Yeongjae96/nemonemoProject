package com.nemo.user.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.main.respository.impl.MainMapper;
import com.nemo.user.main.service.GetRecommendProductList3Service;
import com.nemo.user.main.service.GetRecommendProductListService;
import com.nemo.user.main.vo.RecommendProductVO;

@Service
public class GetRecommendProductList3ServiceImpl implements GetRecommendProductList3Service{

	@Autowired
	private MainMapper mainDAO;
	
	@Override
	public List<RecommendProductVO> getRecommendProductList3() {
		return mainDAO.getRecommendProductList3();
	}

	
}
