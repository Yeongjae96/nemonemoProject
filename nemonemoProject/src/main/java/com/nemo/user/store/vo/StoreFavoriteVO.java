package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StoreFavoriteVO {
	private int productNo;
	private int favoriteSender;
	private String productName;
	private Date productRegDt;
	private String productDealArea;
	private int productPrice;
	private int storeNo;
	private String favoriteDelFl;
}
