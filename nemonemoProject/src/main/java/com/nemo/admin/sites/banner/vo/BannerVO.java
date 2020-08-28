package com.nemo.admin.sites.banner.vo;


import java.sql.Date;

import lombok.Data;


/**
 * @제목 : 배너 VO
 * @패키지이름 : com.nemo.admin.sites.banner.vo
 * @파일이름 : BannerVO.java
 * @작성일 : 2020. 8. 13.
 * @이름 : 강성일
 * @프로그램설명 : 배너 VO
 */


@Data
public class BannerVO {

	private int bannerNo; 		// 배너 기본키
	private int bannerOrder; 	// 배너 순서
	private String bannerClient; // 배너 의뢰주
	private String bannerImageUrl; // 이미지 링크
	private String bannerDestUrl; 
	private String bannerDelFl;  // 사용여부
	private Date bannerRegDt; //등록 날짜

}
