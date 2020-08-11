package com.nemo.admin.members.report.repository;

import java.util.List;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;
import com.nemo.admin.members.report.category.vo.ReportListVO;

/**
 * @제목 : 신고 리스트 맵퍼
 * @패키지이름 : com.nemo.admin.members.report.repository
 * @파일이름 : IReportListMapper.java
 * @작성일 : 2020. 8. 10.
 * @이름 : 강성일
 * @프로그램설명 : 신고 리스트를 위한 맵퍼
 */

public interface IReportListMapper {

	// 데이터 추출 화면에 나타내기 위한 메소드
	public List<ReportListVO> getList(ReportListVO vo);
		
	//데이터 수정
	public int updateList (ReportListVO vo);
	
	//업데이트에 필요한 데이터를 가져오기 위함
	public ReportListVO getUpdateList(int reportNO);
	

}
