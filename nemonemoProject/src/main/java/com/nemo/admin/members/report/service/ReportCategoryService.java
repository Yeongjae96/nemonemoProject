package com.nemo.admin.members.report.service;

import java.util.List;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;


public interface ReportCategoryService {
	
	public int insertCategory(ReportCategoryVO vo);
	public List<ReportCategoryVO> getCategoryList(ReportCategoryVO vo);
	public int deleteCategory(int reportCategoryNO);
	public int updateCategory(ReportCategoryVO vo);
	public ReportCategoryVO getCategory(int reportCategoryNO);
	


}
