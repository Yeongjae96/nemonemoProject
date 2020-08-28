package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreReviewVO {
	private int storeReviewNo;
	private int storeNo;
	private int storeReviewWriter;
	private int storeReviewRating;
	private String storeReviewContent;
	private Date storeReviewRegDt;
	private String storeName;
	private String productName;
}
