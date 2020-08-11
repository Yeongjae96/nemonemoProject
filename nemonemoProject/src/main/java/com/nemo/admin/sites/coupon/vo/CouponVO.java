package com.nemo.admin.sites.coupon.vo;

import lombok.Data;

/**
 * @제목 : 쿠폰 VO 객체
 * @패키지이름 : com.nemo.admin.sites.coupon.vo
 * @파일이름 : CouponVO.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Hyein
 * @프로그램설명 : 쿠폰 테이블의 하나의 행값을 나타내는 값 객체
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 *  20.08.10	이혜인			lombok 라이브러리 추가 및 DB변경사항 적용 
 */
@Data
public class CouponVO {
	private int couponNo;
	private String couponName;
	private String couponContent;
	private String couponPrd;
	private String couponDisPrice;
}
