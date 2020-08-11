package com.nemo.user.term.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 회원 약관 VO 객체
 * @패키지이름 : com.nemo.user.term.vo
 * @파일이름 : TermVO.java
 * @작성일 : 2020. 8. 9
 * @이름 : Hyein
 * @프로그램설명 : 회원약관 테이블의 하나의 행값을 나타내는 값 객체
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 *  20.08.09	이혜인			초기설정
 */

@Data
public class TermVO {
	private int termNo;
//	private String adminRegId;
//	private String adminEditId;
	private String termTitle;
	private String termContent;
	private String termRequiredFl;
	private String termDeleteFl;
//	private Date termRegYmd;
//	private Date termEditYmd;
}
