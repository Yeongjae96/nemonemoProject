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
import com.nemo.admin.sites.faq.vo.AdminBaseFaqVO;

/**
 * @제목 : 관리자 FAQ 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.faq.controller
 * @파일이름 : FaqController.java
 * @작성일 : 2020. 8. 6.
 * @이름 : Yeong
 * @프로그램설명 : site/faq에 해당하는 모든 경로를 맵핑시켜준다.
 */
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
	public ModelAndView faqNewAction(AdminBaseFaqVO vo) {
		ModelAndView mav = new ModelAndView("redirect:/sites/faq/list.mdo");
		return mav;
	}
	
	@GetMapping("/edit")
	public ModelAndView faqEditPage() {
		return new ModelAndView("sites/faq/site_faq_edit");
	}
	
	@PostMapping("/edit")
	public @ResponseBody int faqEditAction(AdminBaseFaqVO vo) {		
		return faqService.updateFaq(vo);
	}
	
	@PostMapping("/delete")
	
	public @ResponseBody int faqDeleteAction(@RequestParam int faqNo) {
		return faqService.deleteFaq(faqNo);
	}
	
	
	@GetMapping("/getFaqJson")
	public @ResponseBody AdminFaqResponseVO getFaq(@RequestParam int faqNo) {
		return faqService.getFaq(faqNo);
	}
	
	@PostMapping("/flag")
	public @ResponseBody int useFlagToggleAction(AdminBaseFaqVO vo) {
		return faqUseFlagService.updateUseFlag(vo);
	}
}
