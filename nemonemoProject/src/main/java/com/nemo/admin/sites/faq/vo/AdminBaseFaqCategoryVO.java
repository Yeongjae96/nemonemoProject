package com.nemo.admin.sites.faq.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminBaseFaqCategoryVO {
	private int faqCategoryNo;
	private String faqCategoryName;
	private Date faqCategoryRegYmd;
	private String faqCategoryUseFl;
	
}
