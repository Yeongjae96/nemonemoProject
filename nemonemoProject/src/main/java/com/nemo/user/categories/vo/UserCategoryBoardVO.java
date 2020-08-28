package com.nemo.user.categories.vo;

import java.util.List;
import java.util.Map;

import com.nemo.common.paging.PageVO;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsVO;

import lombok.Data;

@Data
public class UserCategoryBoardVO {
	
	Map<String, List<UserBaseProductsCategoryVO>> categoryMap;
	private List<UserBaseProductsVO> productList;
	private List<PdImgArticleVO> pdImgArticleList;
	private UserBaseProductsCategoryVO selectedCategory;
	private PageVO pageVO;
}
