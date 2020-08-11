package com.nemo.admin.members.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.nemo.admin.members.report.category.vo.ReportListVO;
import com.nemo.admin.members.report.repository.impl.ReportListMapper;
import com.nemo.admin.members.report.service.ReportListService;


@Service
public class ReportListServiceImpl implements ReportListService {

	@Autowired
	private ReportListMapper ListDAO;
	
	
	
	//데이터 베이스에 저장된 값을 가져오기 위한 메서드
	@Override
	public List<ReportListVO> getList(ReportListVO vo) {
		
		return ListDAO.getList(vo);
	}


	
	//update 문
	@Override
	public int updateList(ReportListVO vo) {
		
		return ListDAO.updateList(vo);
	}


	//update를 하기위해서 테이블 번호를 가져옴
	@Override
	public ReportListVO getUpdateList(int reportNO) {
		
		return ListDAO.getUpdateList(reportNO);
	}

}
