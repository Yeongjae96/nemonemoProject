package com.nemo.user.main.respository;

import java.util.List;

import com.nemo.user.main.vo.PopularCateVO;
import com.nemo.user.main.vo.PopularProductVO;
import com.nemo.user.main.vo.RecommendProductVO;

public interface IMainMapper {
	public List<RecommendProductVO> getRecommendProductList();
	public List<PopularCateVO> getPopularCateList();
	public List<PopularProductVO> getPopularProductList();
}
