package com.nemo.user.products.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserBaseProductsCategoryVO {
	private int productCateNo;
	private int adminRegId;
	private int adminEditId;
	private String productCateLarge;
	private String productCateMedium;
	private String productCateSmall;
	private String productCateDelFl;
	private Date productCateRegYmd;
	private Date productCateEditYmd;
}