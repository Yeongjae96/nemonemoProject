package com.nemo.admin.members.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;
import com.nemo.admin.members.report.repository.impl.ReportCategoryMapper;
import com.nemo.admin.members.report.service.ReportCategoryService;

@Service
public class ReportCategoryServiceImpl implements ReportCategoryService {

	@Autowired
	private ReportCategoryMapper CategoryDAO;

	@Override
	public int insertCategory(ReportCategoryVO vo) {

		return CategoryDAO.insertCategory(vo);
	}

	@Override
	public List<ReportCategoryVO> getCategoryList(ReportCategoryVO vo) {

		return CategoryDAO.getCategoryList(vo);
	}

	@Override
	public int deleteCategory(int reportCategoryNO) {

		return CategoryDAO.deleteCategory(reportCategoryNO);
	}

	@Override
	public int updateCategory(ReportCategoryVO vo) {

		return CategoryDAO.updateCategory(vo);
	}

	@Override
	public ReportCategoryVO getCategory(int reportCategoryNO) {

		return CategoryDAO.getCategory(reportCategoryNO);
	}

}
