package com.nemo.admin.members.report.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;
import com.nemo.admin.members.report.category.vo.ReportListVO;
import com.nemo.admin.members.report.service.ReportListService;

/**
 * @제목 : 신고리스트 컨트롤러
 * @패키지이름 : com.nemo.admin.members.report.category.controller
 * @파일이름 : ReportListController.java
 * @작성일 : 2020. 8. 10.
 * @이름 : 강성일
 * @프로그램설명 : 신고기능 리스트 컨트롤러
 */

@Controller
@RequestMapping("/members/report")
public class ReportListController {

	@Autowired
	private ReportListService listService;

	@GetMapping("list")
	public ModelAndView ListPage(ReportListVO vo) {
		ModelAndView mav = new ModelAndView("members/report/member_report_list");
		List<ReportListVO> data = listService.getList(vo);
		mav.addObject("reportList", data);
		return mav;

	}

	// update

	@RequestMapping(value = "edit", method = { RequestMethod.POST })
	public ModelAndView ListEditAction(ReportListVO vo) {

		System.out.println("edit POST cont : " + vo);

		listService.updateList(vo);

		return new ModelAndView("redirect:/members/report/list.mdo");
	}

	@GetMapping("edit")
	public ModelAndView ListEditPage(@RequestParam int reportNO) {

		ModelAndView mav = new ModelAndView("members/report/member_report_list_edit");
		System.out.println("edit cont : " + reportNO);
		ReportListVO reportListVO = listService.getUpdateList(reportNO);

		mav.addObject("reportListVO", reportListVO);

		return mav;

	}

}
