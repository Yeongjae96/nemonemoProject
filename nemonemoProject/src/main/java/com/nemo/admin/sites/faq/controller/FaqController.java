package com.nemo.admin.sites.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.faq.service.FaqService;
import com.nemo.admin.sites.faq.service.FaqUseFlagService;
import com.nemo.admin.sites.faq.vo.AdminFaqResponseVO;
import com.nemo.admin.sites.faq.vo.BaseFaqVO;

@Controller
@RequestMapping("/sites/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	@Autowired
	private FaqUseFlagService faqUseFlagService;
	
	@GetMapping("/list")
	public ModelAndView faqListPage(@RequestParam(required = false, defaultValue = "N") String useFlagMode) {
		
		ModelAndView mav = new ModelAndView("sites/faq/site_faq_list");
		mav.addObject("faqList", faqService.getFaqList(useFlagMode));
		return mav;
	}
	
	@GetMapping("/new")
	public ModelAndView faqNewAction() {
		ModelAndView mav = new ModelAndView("sites/faq/site_faq_new");
		return mav;
	}
	
	@PostMapping("/new")
	public ModelAndView faqNewAction(BaseFaqVO vo) {
		System.out.println(vo);
		faqService.insertFaq(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/faq/list.mdo");
		return mav;
	}
	
	@GetMapping("edit")
	public ModelAndView faqEditPage() {
		return new ModelAndView("sites/faq/site_faq_edit");
	}
	
	@PostMapping("edit")
	public @ResponseBody int faqEditAction(BaseFaqVO vo) {		
		return faqService.updateFaq(vo);
	}
	
	@PostMapping("delete")
	public @ResponseBody int faqDeleteAction(@RequestParam int faqNo) {
		return faqService.deleteFaq(faqNo);
	}
	
	
	@GetMapping("getFaqJson")
	public @ResponseBody AdminFaqResponseVO getFaq(@RequestParam int faqNo) {
		return faqService.getFaq(faqNo);
	}
	
	@PostMapping("flag.mdo")
	public @ResponseBody int useFlagToggleAction(BaseFaqVO vo) {
		return faqUseFlagService.updateUseFlag(vo);
	}
}
