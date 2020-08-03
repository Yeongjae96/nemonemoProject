package com.nemo.admin.sites.faq.vo;

import java.sql.Date;

public class FaqCategoryVO {
	private int faqCategoryNo;
	private String faqCategoryName;
	private Date faqCategoryRegistryYmd;
	private String faqCategoryUseFl;
	
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
	public Date getFaqCategoryRegistryYmd() {
		return faqCategoryRegistryYmd;
	}
	public void setFaqCategoryRegistryYmd(Date faqCategoryRegistryYmd) {
		this.faqCategoryRegistryYmd = faqCategoryRegistryYmd;
	}
	public String getFaqCategoryUseFl() {
		return faqCategoryUseFl;
	}
	public void setFaqCategoryUseFl(String faqCategoryUseFl) {
		this.faqCategoryUseFl = faqCategoryUseFl;
	}
	@Override
	public String toString() {
		return "FaqCategoryVO [faqCategoryNo=" + faqCategoryNo + ", faqCategoryName=" + faqCategoryName
				+ ", faqCategoryRegistryYmd=" + faqCategoryRegistryYmd + ", faqCategoryUseFl=" + faqCategoryUseFl + "]";
	}
	
	
}
