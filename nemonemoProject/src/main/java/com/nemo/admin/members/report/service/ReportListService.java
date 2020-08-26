package com.nemo.admin.members.report.service;

import java.util.List;

import com.nemo.admin.members.report.category.vo.ReportListVO;

/**
 * @제목 : 신고 리스트 서비스
 * @패키지이름 : com.nemo.admin.members.report.service
 * @파일이름 : ReportListService.java
 * @작성일 : 2020. 8. 7.
 * @이름 : 강성일
 * @프로그램설명 : 신고 리스트 서비스 인터페이스
 */
public interface ReportListService {

	// 데이터 베이스에 저장된 정보를 가져오기 위한 메서드
	public List<ReportListVO> getList(ReportListVO vo);

	// 데이터 수정
	public int updateList(ReportListVO vo);

	// 업데이트에 필요한 데이터를 가져오기 위함
	public ReportListVO getUpdateList(int reportNO);

}
