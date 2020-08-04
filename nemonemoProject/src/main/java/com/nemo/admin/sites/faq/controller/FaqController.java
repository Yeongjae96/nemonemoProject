package com.nemo.admin.sites.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.faq.service.FaqService;
import com.nemo.admin.sites.faq.vo.AdminFaqRequestVO;

@Controller
@RequestMapping("/sites/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
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
	public ModelAndView faqNewAction(AdminFaqRequestVO vo) {
		System.out.println(vo);
		faqService.insertFaq(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/faq/list.mdo");
		return mav;
	}
}
