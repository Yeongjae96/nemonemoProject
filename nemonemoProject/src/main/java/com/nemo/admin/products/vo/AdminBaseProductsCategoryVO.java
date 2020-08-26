package com.nemo.admin.products.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 관리자 기본 상품 카테고리 VO
 * @패키지이름 : com.nemo.admin.products.vo
 * @파일이름 : AdminBaseProductsCategoryVO.java
 * @작성일 : 2020. 8. 9.
 * @이름 : Yeong
 * @프로그램설명 : 관리자테이블에서 기본적으로 상품 카테고리 테이블의 ROW를 담을 VO 객체이다.
 */
@Data
public class AdminBaseProductsCategoryVO {
	private int productCateNo;
	private int adminRegId;
	private int adminEditId;
	private String productCateType;
	private String productCateLarge;
	private String productCateMedium;
	private String productCateSmall;
	private int productCateOrder;
	private String productCateDelFl;
	private Date productCateRegYmd;
	private Date productCateEditYmd;
}
