package com.nemo.admin.members.report.category.vo;

import lombok.Data;

/**
 * @제목 : 신고 카테고리 VO
 * @패키지이름 : com.nemo.admin.members.report.category.vo
 * @파일이름 : ReportCategoryVO.java
 * @작성일 : 2020. 8. 7.
 * @이름 : 강성일
 * @프로그램설명 : 신고 카테고리 VO
 */

@Data
public class ReportCategoryVO {

	private int reportCategoryNO;
	private String reportCategoryTopCategoryCode;
	private String reportCategoryName;
	private String reportCategoryUseFl;

}
