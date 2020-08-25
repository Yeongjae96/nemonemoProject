package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StoreImageVO {
	
	private int storeImgNo;
	private int storeNo;
	private String storeImgOriginName;
	private String storeImgFileName;
	private long storeImgFileSize;
	private int storeImgWidth;
	private int storeImgHeight;
	private String storeImgType;
	private Date storeImgDt;
	
}
