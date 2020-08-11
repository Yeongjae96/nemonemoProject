package com.nemo.user.customer.faq.vo;

import java.sql.Date;

public class BaseUserFaqVO {
	private int faqNO;
	private int faqCategoryNo;
	private String faqTitle;
	private String faqContent;
	private Date faqRegYmd;
	private String faqUseFlag;
	public int getFaqNO() {
		return faqNO;
	}
	public void setFaqNO(int faqNO) {
		this.faqNO = faqNO;
	}
	public int getFaqCategoryNo() {
		return faqCategoryNo;
	}
	public void setFaqCategoryNo(int faqCategoryNo) {
		this.faqCategoryNo = faqCategoryNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqRegYmd() {
		return faqRegYmd;
	}
	public void setFaqRegYmd(Date faqRegYmd) {
		this.faqRegYmd = faqRegYmd;
	}
	public String getFaqUseFlag() {
		return faqUseFlag;
	}
	public void setFaqUseFlag(String faqUseFlag) {
		this.faqUseFlag = faqUseFlag;
	}
	@Override
	public String toString() {
		return "BaseUserFaqVO [faqNO=" + faqNO + ", faqCategoryNo=" + faqCategoryNo + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", faqRegYmd=" + faqRegYmd + ", faqUseFlag=" + faqUseFlag + "]";
	}
	
	
}
