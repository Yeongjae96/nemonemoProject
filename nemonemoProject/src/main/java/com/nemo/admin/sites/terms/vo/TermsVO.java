package com.nemo.admin.sites.terms.vo;

import java.sql.Date;

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
 * 	20.08.03	이혜인				컬럼 타입 변경(termsRegistryYmd, termsModifyYmd)
 *  20.08.04	이혜인				컬럼명 변경(Registry->Reg, Modify->Edit)
 */
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
	public int getTermsNo() {
		return termsNo;
	}
	public void setTermsNo(int termsNo) {
		this.termsNo = termsNo;
	}
	public String getAdminRegId() {
		return adminRegId;
	}
	public void setAdminRegId(String adminRegId) {
		this.adminRegId = adminRegId;
	}
	public String getAdminEditId() {
		return adminEditId;
	}
	public void setAdminEditId(String adminEditId) {
		this.adminEditId = adminEditId;
	}
	public String getTermsTitle() {
		return termsTitle;
	}
	public void setTermsTitle(String termsTitle) {
		this.termsTitle = termsTitle;
	}
	public String getTermsContent() {
		return termsContent;
	}
	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
	}
	public String getTermsRequiredFl() {
		return termsRequiredFl;
	}
	public void setTermsRequiredFl(String termsRequiredFl) {
		this.termsRequiredFl = termsRequiredFl;
	}
	public String getTermsDeleteFl() {
		return termsDeleteFl;
	}
	public void setTermsDeleteFl(String termsDeleteFl) {
		this.termsDeleteFl = termsDeleteFl;
	}
	public Date getTermsRegYmd() {
		return termsRegYmd;
	}
	public void setTermsRegYmd(Date termsRegYmd) {
		this.termsRegYmd = termsRegYmd;
	}
	public Date getTermsEditYmd() {
		return termsEditYmd;
	}
	public void setTermsEditYmd(Date termsEditYmd) {
		this.termsEditYmd = termsEditYmd;
	}
	@Override
	public String toString() {
		return "TermsVO [termsNo=" + termsNo + ", adminRegId=" + adminRegId + ", adminEditId=" + adminEditId
				+ ", termsTitle=" + termsTitle + ", termsContent=" + termsContent + ", termsRequiredFl="
				+ termsRequiredFl + ", termsDeleteFl=" + termsDeleteFl + ", termsRegYmd=" + termsRegYmd
				+ ", termsEditYmd=" + termsEditYmd + "]";
	}
}
