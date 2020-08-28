package com.nemo.user.products.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserProductsManageVO {
	private int userNo;
	private int productNo;
	private String productDispSt;
	private String productName;
	private int productPrice;
	private Timestamp productRegDt;
	private Timestamp productEditDt;
	private int productImgNo;
	private int favoriteCnt;
	private int commentCnt;
}
