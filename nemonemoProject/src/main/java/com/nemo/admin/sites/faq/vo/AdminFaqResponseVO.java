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
public class AdminFaqResponseVO extends BaseFaqVO{
	private String faqCategoryName;

	public String getFaqCategoryName() {
		return faqCategoryName;
	}

	public void setFaqCategoryName(String faqCategoryName) {
		this.faqCategoryName = faqCategoryName;
	}
	
	
	
}
