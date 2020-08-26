package com.nemo.user.customer.faq.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserBaseFaqCategoryVO {
	
	private int faqCategoryNo;
	private String faqCategoryName;
	private Date faqCategoryRegYmd;
	private String faqCategoryUseFlag;
	
}
