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
import com.nemo.admin.members.report.service.ReportCategoryService;


@Controller
@RequestMapping("/members/report")
public class ReportCategoryController {

	@Autowired
	private ReportCategoryService categoryService;

	// insert
	@GetMapping("/category/list")
	public ModelAndView CategoryPage(ReportCategoryVO vo) {
		ModelAndView mav = new ModelAndView("members/report/category/member_report");
		List<ReportCategoryVO> data = categoryService.getCategoryList(vo);
		mav.addObject("reportCategoryList", data);
		return mav;

	}

	// insert
	@RequestMapping(value = "/category/add", method = { RequestMethod.POST })
	public ModelAndView CategoryAction(ReportCategoryVO vo) {
		categoryService.insertCategory(vo);
		ModelAndView mav = new ModelAndView("redirect:/members/report/category/list.mdo");
		return mav;
	}

	// delect
	@RequestMapping(value = "/category/delete", method = { RequestMethod.POST })
	public ModelAndView CategoryDeleteAction(@RequestParam int reportCategoryNO) {
		categoryService.deleteCategory(reportCategoryNO);

		ModelAndView mav = new ModelAndView("redirect:/members/report/category/list.mdo");
		return mav;
	}

	// update

	@GetMapping("/category/edit")
	public ModelAndView CategoryEditPage(@RequestParam int reportCategoryNO) {

		ModelAndView mav = new ModelAndView("members/report/category/member_report_edit");
		System.out.println("edit cont : " + reportCategoryNO);
		ReportCategoryVO reportCategoryVO = categoryService.getCategory(reportCategoryNO);	

		mav.addObject("reportCategoryVO",reportCategoryVO);

		return mav;

	}

	@RequestMapping(value = "/category/edit", method = { RequestMethod.POST })
	public ModelAndView CategoryEditAction(ReportCategoryVO vo) {

		System.out.println("edit POST cont : " + vo);

		categoryService.updateCategory(vo);

		return new ModelAndView("redirect:/members/report/category/list.mdo");
	}



}
