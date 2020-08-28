package com.nemo.user.products.repository;

import java.util.List;

import com.nemo.user.products.vo.UserBaseProductsFavoriteVO;

public interface IUserProductsFavoriteMapper {
	public int insertFavorite(UserBaseProductsFavoriteVO vo);
	public int deleteFavorite(UserBaseProductsFavoriteVO vo);
	public List<UserBaseProductsFavoriteVO> getFavoriteList(int productNo);
}
