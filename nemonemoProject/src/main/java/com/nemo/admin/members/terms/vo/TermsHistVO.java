package com.nemo.admin.members.terms.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 약관내역 VO 객체
 * @패키지이름 : com.nemo.admin.members.terms.hist.vo
 * @파일이름 : TermsHistVO.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Hyein
 * @프로그램설명 : 약관내역 테이블의 하나의 행값을 나타내는 값 객체
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 *  20.08.10	이혜인			초기설정
 */

@Data
public class TermsHistVO {
	private int termsHistNo;
	private int termsNo;
	private int userNo;
	private String termsAgreeFl;
	private Date termsAgreeYmd;
}
