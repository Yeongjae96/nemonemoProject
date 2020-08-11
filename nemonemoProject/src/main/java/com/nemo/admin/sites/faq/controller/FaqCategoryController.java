package com.nemo.admin.sites.faq.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.faq.service.FaqCategoryService;
import com.nemo.admin.sites.faq.service.FaqCategoryUseFlagService;
import com.nemo.admin.sites.faq.vo.FaqCategoryVO;

/**
 * @제목 : 자주묻는 질문 카테고리 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.faq.controller
 * @파일이름 : FaqCategoryController.java
 * @작성일 : 2020. 8. 2.
 * @이름 : Yeong
 * @프로그램설명 : 자주묻는질문 카테고리에 대한 url 요청을 처리하고 응답해준다.
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
@Controller
@RequestMapping("sites/faq/category")
public class FaqCategoryController {
	
	@Autowired
	public FaqCategoryService faqCategoryService;
	@Autowired
	public FaqCategoryUseFlagService faqCategoryUseFlagService;
	
	@GetMapping("/list")
	public ModelAndView faqCategoryPage(@RequestParam(required = false, defaultValue = "N") String faqCategoryUseFlMode) {
		
		ModelAndView mav = new ModelAndView("sites/faq/category/site_faq_category_list");
		List<FaqCategoryVO> faqCategoryList = faqCategoryService.getFaqCategoryList(faqCategoryUseFlMode);
		System.out.println(faqCategoryList);
		mav.addObject("faqCategoryList",faqCategoryList);
		return mav;
	}
	
	
	
	
	@PostMapping("/new")
	public ModelAndView faqCategoryNewAction(FaqCategoryVO vo) {
	
		faqCategoryService.insertFaqCategory(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/faq/category/list.mdo");
		return mav;
	}
	
	
	@GetMapping("/listJson")
	@ResponseBody
	public List<FaqCategoryVO> faqCategoryListJSON() {
		return faqCategoryService.getFaqCategoryList("Y");
	}
	
	@GetMapping("/edit")
	@ResponseBody
	public FaqCategoryVO faqCategoryEditJSON(@RequestParam int faqCategoryNo) {
		return faqCategoryService.getFaqCategory(faqCategoryNo);
	}
	
	
	@PostMapping("/edit")
	@ResponseBody
	public int faqCategoryEditPostJSON(FaqCategoryVO vo) {
		return faqCategoryService.updateFaqCategory(vo);
	}
	
	@PostMapping("/flag")
	@ResponseBody
	public int faqCategoryFlagEditPostJSON(@RequestParam Map<String, Object> useFlagUpdateParamMap) {
		System.out.println(useFlagUpdateParamMap);
		return faqCategoryUseFlagService.updateUseFlag(useFlagUpdateParamMap);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public int faqCategoryDeletePostJSON(@RequestParam int faqCategoryNo) {
		return faqCategoryService.deleteFaqCategory(faqCategoryNo);
	}
	
}	
