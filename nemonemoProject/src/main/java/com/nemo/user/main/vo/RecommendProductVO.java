package com.nemo.user.main.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecommendProductVO {
	private int productNo;
	private int productSeller;
	private int productCateNo;
	private String productName;
	private String productDealArea;
	private String productUsedSt;
	private String productDispSt;
	private String productExchSt;
	private Date productSoldDt;
	private String productFreeShippingSt;
	private int productPrice;
	private String productInfo;
	private String productTag;
	private int productQty;
	private Timestamp productRegDt;
	private Date productEditDt;
	private int productView;
}
