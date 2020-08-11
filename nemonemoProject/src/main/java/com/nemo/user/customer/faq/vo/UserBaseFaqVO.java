package com.nemo.user.customer.faq.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : BaseUserFaqVO
 * @패키지이름 : com.nemo.user.customer.faq.vo
 * @파일이름 : BaseUserFaqVO.java
 * @작성일 : 2020. 8. 7.
 * @이름 : Yeong
 * @프로그램설명 : Faq 테이블에 대한 VO 객체
 */
@Data
public class UserBaseFaqVO {
	private int faqNo;
	private int faqCategoryNo;
	private String faqTitle;
	private String faqContent;
	private Date faqRegYmd;
	private String faqUseFlag;
	
}
