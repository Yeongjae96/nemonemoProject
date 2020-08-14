package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StoreProductVO {
	private int userNo;
	private int storeNo;
	private int productNo;
	private int productSeller;
	private String productName;
	private String dealArea;
	private String productDispSt;
	private int productPrice;
	private Date productRegDt;
}
