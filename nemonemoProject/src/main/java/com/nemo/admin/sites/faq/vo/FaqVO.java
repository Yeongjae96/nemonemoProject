package com.nemo.admin.sites.faq.vo;

import java.sql.Date;

/**
 * @제목 : FAQ VO객체
 * @패키지이름 : com.nemo.admin.sites.faq.vo
 * @파일이름 : FaqVO.java
 * @작성일 : 2020. 8. 1.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 테이블 값 로우하나를 뜻함
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public class FaqVO {
	private int faqNo;
	private int faqCategoryNo;
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
	
	
}
