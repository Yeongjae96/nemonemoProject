package com.nemo.admin.members.report.category.vo;

import java.sql.Date;

import lombok.Data;



/**
 * @제목 : ReportListVO
 * @패키지이름 : com.nemo.admin.members.report.category.vo
 * @파일이름 : ReportListVO.java
 * @작성일 : 2020. 8. 10.
 * @이름 : 강성일
 * @프로그램설명 : ReportListVO
 */

@Data
public class ReportListVO {
	
	
	private int reportNO;
	private int reportStoreNO;
	private int reportProductNO;
	private String reportType;
	private int reportCateNO;
	private int reportSender;
	private String reportContent;
	private Date reportRegDate;
	private String reportST;
	private int adminActId;
	private Date reportActDt;
	

}
