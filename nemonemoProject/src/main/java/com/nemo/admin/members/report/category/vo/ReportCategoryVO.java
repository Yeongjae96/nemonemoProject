package com.nemo.admin.members.report.category.vo;

public class ReportCategoryVO {

	private int reportCategoryNO;
	private String reportCategoryTopCategoryCode;
	private String reportCategoryName;
	private String reportCategoryUseFl;
	
	
	
	
	public int getReportCategoryNO() {
		return reportCategoryNO;
	}
	public void setReportCategoryNO(int reportCategoryNO) {
		this.reportCategoryNO = reportCategoryNO;
	}
	public String getReportCategoryTopCategoryCode() {
		return reportCategoryTopCategoryCode;
	}
	public void setReportCategoryTopCategoryCode(String reportCategoryTopCategoryCode) {
		this.reportCategoryTopCategoryCode = reportCategoryTopCategoryCode;
	}
	public String getReportCategoryName() {
		return reportCategoryName;
	}
	public void setReportCategoryName(String reportCategoryName) {
		this.reportCategoryName = reportCategoryName;
	}
	public String getReportCategoryUseFl() {
		return reportCategoryUseFl;
	}
	public void setReportCategoryUseFl(String reportCategoryUseFl) {
		this.reportCategoryUseFl = reportCategoryUseFl;
	}
	@Override
	public String toString() {
		return "ReportCategoryVO [reportCategoryNO=" + reportCategoryNO + ", reportCategoryTopCategoryCode="
				+ reportCategoryTopCategoryCode + ", reportCategoryName=" + reportCategoryName
				+ ", reportCategoryUseFl=" + reportCategoryUseFl + "]";
	}
	
	
	
	

	
}
