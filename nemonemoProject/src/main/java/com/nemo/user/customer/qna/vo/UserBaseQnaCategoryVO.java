package com.nemo.user.customer.qna.vo;

import lombok.Data;


/**
 * @제목 : QNA 사용자 카테고리 VO객체
 * @패키지이름 : com.nemo.admin.customer.qna.vo
 * @파일이름 : UserBaseFaqCategoryVO.java
 * @작성일 : 2020. 8. 9
 * @이름 : Yerin
 * @프로그램설명 : QNA 테이블 값 로우하나를 뜻함
 *  
 */

@Data
public class UserBaseQnaCategoryVO{
	
	private int qnaCategoryNo;
	private String qnaCategoryName;
	private String qnaCategoryUseFl;

}
