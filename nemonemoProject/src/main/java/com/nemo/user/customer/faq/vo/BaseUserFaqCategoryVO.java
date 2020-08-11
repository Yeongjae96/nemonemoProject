package com.nemo.user.customer.faq.vo;

import java.sql.Date;

public class BaseUserFaqCategoryVO {
	
	private int faqCategoryNo;
	private String faqCategoryName;
	private Date faqCategoryRegYmd;
	private String faqCategoryUseFlag;
	public int getFaqCategoryNo() {
		return faqCategoryNo;
	}
	public void setFaqCategoryNo(int faqCategoryNo) {
		this.faqCategoryNo = faqCategoryNo;
	}
	public String getFaqCategoryName() {
		return faqCategoryName;
	}
	public void setFaqCategoryName(String faqCategoryName) {
		this.faqCategoryName = faqCategoryName;
	}
	public Date getFaqCategoryRegYmd() {
		return faqCategoryRegYmd;
	}
	public void setFaqCategoryRegYmd(Date faqCategoryRegYmd) {
		this.faqCategoryRegYmd = faqCategoryRegYmd;
	}
	public String getFaqCategoryUseFlag() {
		return faqCategoryUseFlag;
	}
	public void setFaqCategoryUseFlag(String faqCategoryUseFlag) {
		this.faqCategoryUseFlag = faqCategoryUseFlag;
	}
	
	@Override
	public String toString() {
		return "BaseUserFaqCategoryVO [faqCategoryNo=" + faqCategoryNo + ", faqCategoryName=" + faqCategoryName
				+ ", faqCategoryRegYmd=" + faqCategoryRegYmd + ", faqCategoryUseFlag=" + faqCategoryUseFlag + "]";
	}
	
	
	
}
