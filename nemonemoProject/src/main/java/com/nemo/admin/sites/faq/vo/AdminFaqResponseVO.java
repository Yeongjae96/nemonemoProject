package com.nemo.admin.sites.faq.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @제목 : FAQ VO객체
 * @패키지이름 : com.nemo.admin.sites.faq.vo
 * @파일이름 : FaqVO.java
 * @작성일 : 2020. 8. 1.
 * @이름 : Yeong
 * @프로그램설명 : FAQ 테이블 값 로우하나를 뜻함
 */

@Getter
@Setter
@ToString(callSuper=true)
public class AdminFaqResponseVO extends AdminBaseFaqVO{
	private String faqCategoryName;
	
}
