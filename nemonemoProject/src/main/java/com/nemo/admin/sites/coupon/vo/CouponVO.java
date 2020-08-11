package com.nemo.admin.sites.coupon.vo;

import java.sql.Date;

public class CouponVO {
	private String couponCd;
	private String couponNm;
	private String couponContent;
	private String couponSrtYmd;
	private String couponEndYmd;
	private String couponDisPrice;
	public String getCouponCd() {
		return couponCd;
	}
	public void setCouponCd(String couponCd) {
		this.couponCd = couponCd;
	}
	public String getCouponNm() {
		return couponNm;
	}
	public void setCouponNm(String couponNm) {
		this.couponNm = couponNm;
	}
	public String getCouponContent() {
		return couponContent;
	}
	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}
	public String getCouponSrtYmd() {
		return couponSrtYmd;
	}
	public void setCouponSrtYmd(String couponSrtYmd) {
		this.couponSrtYmd = couponSrtYmd;
	}
	public String getCouponEndYmd() {
		return couponEndYmd;
	}
	public void setCouponEndYmd(String couponEndYmd) {
		this.couponEndYmd = couponEndYmd;
	}
	public String getCouponDisPrice() {
		return couponDisPrice;
	}
	public void setCouponDisPrice(String couponDisPrice) {
		this.couponDisPrice = couponDisPrice;
	}
	@Override
	public String toString() {
		return "CouponVO [couponCd=" + couponCd + ", couponNm=" + couponNm + ", couponContent=" + couponContent
				+ ", couponSrtYmd=" + couponSrtYmd + ", couponEndYmd=" + couponEndYmd + ", couponDisPrice="
				+ couponDisPrice + "]";
	}
	
}
