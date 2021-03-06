package com.nemo.admin.members.report.repository;

import java.util.List;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;



/**
 * @제목 : 신고 카테고리를 위한 맵퍼
 * @패키지이름 : com.nemo.admin.members.report.repository
 * @파일이름 : IReportCategoryMapper.java
 * @작성일 : 2020. 8. 7.
 * @이름 : 강성일
 * @프로그램설명 : 신고 카테고리를 위한 맵퍼
 */


public interface IReportCategoryMapper {
	
	//데이터 삽입
	public int insertCategory(ReportCategoryVO vo);
	
	//데이터 추출
	public List<ReportCategoryVO> getCategoryList(ReportCategoryVO vo);
	
	//데이터 삭제
	public int deleteCategory(int reportCategoryNO);
	
	//데이터 수정
	public int updateCategory(ReportCategoryVO vo);
	
	//업데이트에 필요한 데이터를 가져오기 위함
	public ReportCategoryVO getCategory(int reportCategoryNO);
	

}
