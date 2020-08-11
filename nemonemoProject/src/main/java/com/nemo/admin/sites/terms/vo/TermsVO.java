package com.nemo.admin.sites.terms.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 약관 VO 객체
 * @패키지이름 : com.nemo.admin.sites.terms.vo
 * @파일이름 : TermsVO.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Hyein
 * @프로그램설명 : 약관 테이블의 하나의 행값을 나타내는 값 객체
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.30 	김영재				테이블 명세서에 따른 초기설정			
 * 	20.07.30 	김영재				컬럼 변경에 대한 수정(deleteFl 추가, modifyId추가, adminId 수정)
 * 	20.08.03	이혜인				컬럼 타입 변경(termsRegistryYmd, termsModifyYmd)
 *  20.08.04	이혜인				컬럼명 변경(Registry->Reg, Modify->Edit)
 *  20.08.07	이혜인				lombok 라이브러리 추가
 */

@Data
public class TermsVO {
	private int termsNo;
	private String adminRegId;
	private String adminEditId;
	private String termsTitle;
	private String termsContent;
	private String termsRequiredFl;
	private String termsDeleteFl;
	private Date termsRegYmd;
	private Date termsEditYmd;
}
