package com.nemo.user.products.service;

import com.nemo.user.products.vo.UserBaseProductsFavoriteVO;

public interface UserProductsFavoriteService {
	public int insertFavorite(UserBaseProductsFavoriteVO vo);
	public int deleteFavorite(UserBaseProductsFavoriteVO vo);
}
