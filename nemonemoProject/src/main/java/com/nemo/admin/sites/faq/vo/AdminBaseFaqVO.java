package com.nemo.admin.sites.faq.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminBaseFaqVO {
	private int faqNo;
	private String faqCategoryNo;
	private String faqTitle;
	private String faqContent;
	private String faqUseFlag;
	private Date faqRegYmd;
}
