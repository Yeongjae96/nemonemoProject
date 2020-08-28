package com.nemo.user.categories.service;

import com.nemo.common.paging.PageVO;
import com.nemo.user.categories.vo.UserCategoryBoardVO;

public interface CategoryService {
	public UserCategoryBoardVO getCategoryProducts(int productCateNo, PageVO vo);
}
