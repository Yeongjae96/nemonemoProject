package com.nemo.user.search.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserSearchStoreVO {
	
	private int storeNo;
	private String storeName;
	private int storeImgNo;
	private int storeRating;
	private int storeProductCnt;
	private int storeFollowerCnt;
	private int storeReviewCnt;
	
}
