package com.nemo.user.products.vo;

import com.nemo.user.store.vo.StoreReviewVO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class UserGetProductStoreReviewVO extends StoreReviewVO{
	private int storeImgNo;
	private String storeName;
	private int storeRating;
}
