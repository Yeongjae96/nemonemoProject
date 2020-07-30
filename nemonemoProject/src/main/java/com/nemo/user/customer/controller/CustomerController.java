package com.nemo.user.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	/* 관리자 페이지가 나오면 기능 구현 잠정 보류 */
	@GetMapping("/faq/{faqNo}")
	public ModelAndView faqPage(@PathVariable int faqNo) {
		
		ModelAndView mav = new ModelAndView("customer/faq/faq"+faqNo);
		return mav;
	}
	
}