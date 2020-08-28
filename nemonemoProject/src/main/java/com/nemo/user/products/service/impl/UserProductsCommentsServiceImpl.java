package com.nemo.user.products.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.util.ContextUtil;
import com.nemo.user.products.repository.impl.UserProductsCommentsMapper;
import com.nemo.user.products.service.UserProductsCommentsService;
import com.nemo.user.products.vo.ProductsCommentsVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class UserProductsCommentsServiceImpl implements UserProductsCommentsService{
	
	@Autowired
	private UserProductsCommentsMapper productsCommentsMapper;
	
	@Override
	public int insertProductComment(ProductsCommentsVO vo) {
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		// 세션에 사용자값이 없으면 -1 ( 로그인필요 )
		if(user == null) { return -1; }
		
		vo.setProductCommentWriter(user.getUserNo());
		
		int result = productsCommentsMapper.insertProductComment(vo);
		return result;
	}
	
	@Override
	public int deleteProductComment(ProductsCommentsVO vo) {
		return productsCommentsMapper.deleteProductComment(vo);
	}
}
