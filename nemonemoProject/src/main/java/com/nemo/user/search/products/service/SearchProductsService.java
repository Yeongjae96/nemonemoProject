package com.nemo.user.search.products.service;

import com.nemo.common.paging.PageVO;
import com.nemo.user.search.products.vo.SearchProductsVO;

public interface SearchProductsService {
	public SearchProductsVO getSearchArticle(String keyword, String order, int categoryNo, PageVO pageVO);
}
