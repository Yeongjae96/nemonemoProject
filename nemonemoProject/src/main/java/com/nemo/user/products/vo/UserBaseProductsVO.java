package com.nemo.user.products.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 상품 정보 VO
 * @패키지이름 : com.nemo.user.products.vo
 * @파일이름 : ProductsVO.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : Products 테이블과 매핑되는 상품 VO 클래스
 * == 수정 정보 ==
 *
 * DATE			 AUTHOR			NOTE
 * -------		--------			-------------	
 * 20.07.27 	  김영재				테이블 명세서에 따른 초기세팅
 */

@Data
public class UserBaseProductsVO {
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
	private Date productRegDt;
	private Date productEditDt;
	private int productView;
}
