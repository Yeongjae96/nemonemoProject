package com.nemo.user.products.repository;

import java.util.List;

import com.nemo.user.products.vo.UserGetProductStoreReviewVO;
import com.nemo.user.search.products.vo.UserPdPdImgVO;

public interface IUserGetProductMapper {
	public List<UserPdPdImgVO> selectGetStoreProductList(int productSeller);
	public List<UserGetProductStoreReviewVO> selectReviewList(int productSeller);
}
