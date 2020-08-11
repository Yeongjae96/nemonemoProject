package com.nemo.admin.members.report.service;

import java.util.List;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;



/**
 * @제목 : 신고 카테고리 서비스
 * @패키지이름 : com.nemo.admin.members.report.service
 * @파일이름 : ReportCategoryService.java
 * @작성일 : 2020. 8. 7.
 * @이름 : 강성일
 * @프로그램설명 : 신고 카테고리 서비스 인터페이
 */



public interface ReportCategoryService {
	
	public int insertCategory(ReportCategoryVO vo);
	public List<ReportCategoryVO> getCategoryList(ReportCategoryVO vo);
	public int deleteCategory(int reportCategoryNO);
	public int updateCategory(ReportCategoryVO vo);
	public ReportCategoryVO getCategory(int reportCategoryNO);
	


}
