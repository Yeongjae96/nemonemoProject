package com.nemo.admin.members.report.category.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;
import com.nemo.admin.members.report.service.ReportCategoryService;




/**
 * @제목 : 신고카테고리 컨트롤러
 * @패키지이름 : com.nemo.admin.members.report.category.controller
 * @파일이름 : ReportCategoryController.java
 * @작성일 : 2020. 8. 7
 * @이름 : 강성일
 * @프로그램설명 : 신고카테고리 컨트롤러 
 */

@Controller
@RequestMapping("/members/report")
public class ReportCategoryController {

	@Autowired
	private ReportCategoryService categoryService;

	// insert
	@GetMapping("/category/list")
	public ModelAndView CategoryPage(ReportCategoryVO vo) {
		ModelAndView mav = new ModelAndView("members/report/category/member_report_category");
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

	
		//ajax 사용시 ResponseBody가 필요하다.
	
		@RequestMapping(value = "/category/delete", method = { RequestMethod.POST })
		public @ResponseBody int CategoryDeleteAction(@RequestParam int reportCategoryNO) {
			return categoryService.deleteCategory(reportCategoryNO);
			
		}

	// update

	@GetMapping("/category/edit")
	public ModelAndView CategoryEditPage(@RequestParam int reportCategoryNO) {

		ModelAndView mav = new ModelAndView("members/report/category/member_report_category_edit");
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
