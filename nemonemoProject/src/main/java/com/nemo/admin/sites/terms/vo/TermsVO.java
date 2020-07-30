package com.nemo.admin.sites.terms.vo;

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
public class TermsVO {
	private int termsNo;
	private String adminRegistryId;
	private String adminModifyId;
	private String termsTitle;
	private String termsContent;
	private String termsRequiredFl;
	private String termsDeleteFl;
	private String termsRegistryYmd;
	private String termsModifyYmd;
	
	public int getTermsNo() {
		return termsNo;
	}
	public void setTermsNo(int termsNo) {
		this.termsNo = termsNo;
	}
	public String getAdminRegistryId() {
		return adminRegistryId;
	}
	public void setAdminRegistryId(String adminRegistryId) {
		this.adminRegistryId = adminRegistryId;
	}
	public String getAdminModifyId() {
		return adminModifyId;
	}
	public void setAdminModifyId(String adminModifyId) {
		this.adminModifyId = adminModifyId;
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
	public String getTermsRegistryYmd() {
		return termsRegistryYmd;
	}
	public void setTermsRegistryYmd(String termsRegistryYmd) {
		this.termsRegistryYmd = termsRegistryYmd;
	}
	public String getTermsModifyYmd() {
		return termsModifyYmd;
	}
	public void setTermsModifyYmd(String termsModifyYmd) {
		this.termsModifyYmd = termsModifyYmd;
	}
	
	@Override
	public String toString() {
		return "TermsVO [termsNo=" + termsNo + ", adminRegistryId=" + adminRegistryId + ", adminModifyId="
				+ adminModifyId + ", termsTitle=" + termsTitle + ", termsContent=" + termsContent + ", termsRequiredFl="
				+ termsRequiredFl + ", termsDeleteFl=" + termsDeleteFl + ", termsRegistryYmd=" + termsRegistryYmd
				+ ", termsModifyYmd=" + termsModifyYmd + "]";
	}
}
