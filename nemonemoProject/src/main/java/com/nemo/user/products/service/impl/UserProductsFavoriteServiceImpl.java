package com.nemo.user.products.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.util.ContextUtil;
import com.nemo.user.products.repository.impl.UserProductsFavoriteMapper;
import com.nemo.user.products.service.UserProductsFavoriteService;
import com.nemo.user.products.vo.UserBaseProductsFavoriteVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class UserProductsFavoriteServiceImpl implements UserProductsFavoriteService {

	@Autowired
	private UserProductsFavoriteMapper userProductsFavoriteMapper;
	
	@Override
	public int insertFavorite(UserBaseProductsFavoriteVO vo) {
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		if(user == null) {
			return -1;
		}
		vo.setFavoriteSender(user.getUserNo());
			
		return userProductsFavoriteMapper.insertFavorite(vo);
	}

	
	@Override
	public int deleteFavorite(UserBaseProductsFavoriteVO vo) {
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		
		if(user == null) {
			return -1;
		}
		
		vo.setFavoriteSender(user.getUserNo());
		
		return userProductsFavoriteMapper.deleteFavorite(vo);
	}

}
