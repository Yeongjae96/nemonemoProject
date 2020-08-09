package com.nemo.admin.sites.terms.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 약관 VO 객체
 * @패키지이름 : com.nemo.admin.sites.terms.vo
 * @파일이름 : TermsVO.java
 * @작성일 : 2020. 7. 30.
 * @이름 : 약관 테이블의 하나의 행값을 나타내는 값 객체
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				테이블 명세서에 따른 초기설정			
 * 	20.07.30 	김영재				컬럼 변경에 대한 수정(deleteFl 추가, modifyId추가, adminId 수정)
 */

@Data
public class AdminBaseTermsVO {
	private int termsNo;
	private String adminRegistryId;
	private String adminModifyId;
	private String termsTitle;
	private String termsContent;
	private String termsRequiredFl;
	private String termsDeleteFl;
	private Date termsRegistryYmd;
	private Date termsModifyYmd;
	
}
