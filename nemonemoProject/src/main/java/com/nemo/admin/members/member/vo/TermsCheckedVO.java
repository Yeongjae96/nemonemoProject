package com.nemo.admin.members.member.vo;

import java.sql.Date;
import lombok.Data;

/**
 * 
 * @제목 : User의 이용약관 체크 VO객체
 * @패키지이름 : com.nemo.admin.members.member.vo
 * @파일이름 : TermsCheckedVO.java
 * @작성일 : 2020. 8. 18
 * @이름 : Yerin
 * @프로그램설명 : 사용자가 동의한 이용약관 TermCheckedVO 
 *
 */

@Data
public class TermsCheckedVO {
	
	private int termsHistNo;
	private int termsNo;
	private int userNo;
	private String termsAgreeFl;
	private Date termsAgreeYmd;
	private String termsTitle;
	

}
