package com.nemo.user.main.respository;

import java.util.List;

import com.nemo.user.main.vo.PopularCateVO;
import com.nemo.user.main.vo.PopularProductVO;
import com.nemo.user.main.vo.RecommendProductVO;

public interface IMainMapper {
	public List<RecommendProductVO> getRecommendProductList();
	public List<RecommendProductVO> getRecommendProductList2();
	public List<RecommendProductVO> getRecommendProductList3();
	public List<PopularCateVO> getPopularCateList();
	public List<PopularProductVO> getPopularProductList();
}
