package com.nemo.user.search.products.vo;

import java.util.List;
import java.util.Map;

import com.nemo.common.paging.PageVO;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserProductsCategoryCntVO;

import lombok.Data;

@Data
public class SearchProductsVO {
	private List<UserProductsCategoryCntVO> searchedCateList;
	private List<UserPdPdImgVO> pdPdImgList;
	private UserBaseProductsCategoryVO selectedCategory;
	private int productCnt;
	/* 페이징 처리에 필요한 변수 */
	private PageVO pageVO;
}
