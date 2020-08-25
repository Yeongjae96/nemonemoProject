package com.nemo.admin.products.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

/**
 * @제목 : 관리자 기본 상품 카테고리 VO
 * @패키지이름 : com.nemo.admin.products.vo
 * @파일이름 : AdminBaseProductsVO.java
 * @작성일 : 2020. 8. 22
 * @이름 : Yerin
 * @프로그램설명 : 관리자 페이지 상품 목록 테이블 VO 객체
 * 
 */

@Data
public class AdminBaseProductsVO {
	private int productNo;
	private int productSeller;
	private	int productCateNo;
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
