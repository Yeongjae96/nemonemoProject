package com.nemo.admin.sites.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.faq.vo.FaqVO;

@Controller
@RequestMapping("/sites/faq")
public class FaqController {
	
//	@Autowired
//	private f
	
	@GetMapping("/list")
	public ModelAndView faqListPage() {
		
		ModelAndView mav = new ModelAndView("sites/faq/site_faq_list");
		return mav;
	}
	
	@GetMapping("/new")
	public ModelAndView faqNewAction() {
		ModelAndView mav = new ModelAndView("sites/faq/site_faq_new");
		return mav;
	}
	
	@PostMapping("/new")
	public ModelAndView faqNewAction(FaqVO vo) {
		
		ModelAndView mav = new ModelAndView("redirect:/sites/faq/list.mdo");
		return mav;
	}
}
