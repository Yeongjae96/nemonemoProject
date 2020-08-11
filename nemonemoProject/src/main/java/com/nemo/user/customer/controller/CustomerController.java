
package com.nemo.user.customer.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.customer.qna.service.CustomerQnaCategoryService;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;
import com.nemo.user.customer.service.CustomerFaqService;
import com.nemo.user.customer.service.CustomerService;
import com.nemo.user.customer.vo.UserNoticeVO;

/**
 * @제목 : 유저 Customer 컨트롤러
 * @패키지이름 : com.nemo.user.customer
 * @파일이름 : CustomerController.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : Customer URL 요청을 맵핑하여 JSP 경로를 반환시켜주는 컨트롤러
 * == 수정 정보 ==
 *
 * DATE			 	AUTHOR			NOTE
 * -------			--------			-------------	
 * 20.07.30		김영재				customer 초기설정
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerFaqService customerFaqService;

	
	@GetMapping("/notice")
	public ModelAndView noticePage() {
		
		List<UserNoticeVO> noticeList = customerService.getNoticeList();
		ModelAndView mav = new ModelAndView("customer/notice");
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	@GetMapping("/policy")
	public ModelAndView policyPage() {
		
		ModelAndView mav = new ModelAndView("customer/policy");
		return mav;
	}
	
	
	@GetMapping("/faq/start")
	public ModelAndView faqStartPage() {
		
		int start = customerFaqService.getFaqCategoryStartNum();
		ModelAndView mav = new ModelAndView("redirect:/customer/faq/"+start + ".do");
		return mav;
	}
	
	@GetMapping("/faq/{faqCategoryNo}")
	public ModelAndView faqPage(@PathVariable int faqCategoryNo) {
			
		Map<String, Object> resultList = customerFaqService.getFaqCategoryListAndSelectFaqList(faqCategoryNo);
		
		ModelAndView mav = new ModelAndView("customer/faq/faq");
		mav.addObject("faqCategoryList", resultList.get("faqCategoryList"));
		mav.addObject("selectFaqList", resultList.get("selectFaqList"));
		
		return mav;
	}
	
}
