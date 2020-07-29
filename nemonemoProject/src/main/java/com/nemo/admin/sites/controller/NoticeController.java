package com.nemo.admin.sites.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@RequestMapping(value = "/sites/notice", method= {RequestMethod.GET})
	public ModelAndView noticePage() {
		return new ModelAndView("sites/site_notice_list");
	}
	
	@RequestMapping(value = "/sites/notice_edit", method= {RequestMethod.GET})
	public ModelAndView noticeEdit() {
		return new ModelAndView("sites/site_notice_edit");
	}
	
	@RequestMapping(value = "/sites/notice_edit", method= {RequestMethod.POST})
	public ModelAndView noticeEditAction() {
		
		//Service 
		
		return new ModelAndView("redirect:notice.mdo");
	}
}
