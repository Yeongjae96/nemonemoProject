package com.nemo.user.products.vo;

import java.util.List;

import com.nemo.user.search.products.vo.UserPdPdImgVO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class UserGetSellerVO {
	private int storeNo;
	private int storeImgNo;
	private int storeRating;
	private int storeProductCnt;
	private int storeReviewCnt;
	private int storeFollowCnt; // 아직 모르겠다아아아아아아아아아아아앙
	private String storeName;
	private List<UserPdPdImgVO> storeProductList;
	private List<UserGetProductStoreReviewVO> storeReviewList;
}	
