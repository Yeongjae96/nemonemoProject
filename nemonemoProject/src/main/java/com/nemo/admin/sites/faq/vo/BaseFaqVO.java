package com.nemo.admin.sites.faq.vo;

import java.sql.Date;

public class BaseFaqVO {
	private int faqNo;
	private String faqCategoryNo;
	private String faqTitle;
	private String faqContent;
	private String faqUseFlag;
	private Date faqRegYmd;
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqCategoryNo() {
		return faqCategoryNo;
	}
	public void setFaqCategoryNo(String faqCategoryNo) {
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
	public String getFaqUseFlag() {
		return faqUseFlag;
	}
	public void setFaqUseFlag(String faqUseFlag) {
		this.faqUseFlag = faqUseFlag;
	}
	public Date getFaqRegYmd() {
		return faqRegYmd;
	}
	public void setFaqRegYmd(Date faqRegYmd) {
		this.faqRegYmd = faqRegYmd;
	}
	@Override
	public String toString() {
		return "BaseFaqVO [faqNo=" + faqNo + ", faqCategoryNo=" + faqCategoryNo + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", faqUseFlag=" + faqUseFlag + ", faqRegYmd=" + faqRegYmd + "]";
	}
	
}
