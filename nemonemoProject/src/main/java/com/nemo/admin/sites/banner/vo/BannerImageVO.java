package com.nemo.admin.sites.banner.vo;


import java.sql.Date;

import lombok.Data;




@Data
public class BannerImageVO {

	private int bannerImgNo;
	private int bannerNo;
	private String bannerImgOriginName;
	private String bannerImgFileName;
	private long bannerImgFileSize;
	private int bannerImgWidth;
	private int bannerImgHeight;
	private String bannerImgType;
	private Date bannerImgDt;

}
