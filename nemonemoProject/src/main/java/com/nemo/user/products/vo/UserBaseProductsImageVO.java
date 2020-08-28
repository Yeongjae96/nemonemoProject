package com.nemo.user.products.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserBaseProductsImageVO {
	
	private int productImgNo;
	private int productNo;
	private String productImgOriginName;
	private String productImgFileName;
	private long productImgFileSize;
	private int productImgWidth;
	private int productImgHeight;
	private String productImgType;
	private Timestamp productImgDt;
	
}
