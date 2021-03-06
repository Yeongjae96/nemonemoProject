package com.nemo.user.products.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.paging.PageVO;
import com.nemo.common.paging.Pagination;
import com.nemo.common.util.AuthUtil;
import com.nemo.common.util.ContextUtil;
import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.repository.impl.UserProductsManageMapper;
import com.nemo.user.products.service.UserProductsManageService;
import com.nemo.user.products.vo.UserProductsManageResVO;
import com.nemo.user.products.vo.UserProductsManageVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class UserProductsManageServiceImpl implements UserProductsManageService{
	
	@Autowired
	private UserProductsManageMapper userProductsManageMapper;
	
	@Autowired
	private ProductsMapper productsMapper;
	
	@Override
	public UserProductsManageResVO getAllUserProducts(Map<String, Object> manageParamMap) {

		// 1. 세션으로 부터 유저 데이터를 갖고 옴
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		if(user == null) return null;
		
		// 2. 페이징 처리
		
		PageVO pageVO = (PageVO)manageParamMap.get("pageVO");
		Pagination page = new Pagination(pageVO);
		int startNo = page.getStartPageNo();
		int endNo = page.getEndPageNo();
		
		// 3. user 객체로 상품 조회 
		Map<String, Object> manageMapperParamMap = new HashMap<>();
		manageMapperParamMap.put("startNo", startNo);
		manageMapperParamMap.put("endNo", endNo);
		manageMapperParamMap.put("userNo", user.getUserNo());
		manageMapperParamMap.put("status", manageParamMap.get("status"));
		manageMapperParamMap.put("q", manageParamMap.get("keyword"));
		
		List<UserProductsManageVO> productsManageVOList = userProductsManageMapper.getAllUserProducts(manageMapperParamMap);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("productSeller", AuthUtil.getCurrentUserNo());
		paramMap.put("q", manageParamMap.get("keyword"));
		
		PageVO returnPageVO = page.getCalcPageVO(productsMapper.allProductsCntFromSeller(paramMap));
		
		UserProductsManageResVO result = new UserProductsManageResVO();
		result.setProductsManageVOList(productsManageVOList);;
		result.setPageVO(returnPageVO);
		
		return result;
	}
}
