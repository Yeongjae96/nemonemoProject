package com.nemo.user.customer.qna.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;
import com.nemo.user.customer.qna.service.CustomerQnaCategoryService;
import com.nemo.user.customer.qna.service.InsertQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;

/**
 * @제목 : User Customer QNA 컨트롤러
 * @패키지이름 : com.nemo.user.customer.qna.controller
 * @파일이름 : CustomerQnaController.java
 * @작성일 : 2020. 8. 09.
 * @이름 : Yerin
 * @프로그램설명 : Customer QNA URL 요청을 맵핑하여 JSP 경로를 반환시켜주는 컨트롤러
 * 
 */
@Controller
@RequestMapping("/customer")
public class CustomerQnaController {

	@Autowired
	private CustomerQnaCategoryService customerQnaService;
	@Autowired
	private InsertQnaService insertQnaService;
	
	
	@GetMapping("/qna")
	public ModelAndView qnaPage(UserBaseQnaCategoryVO vo) {
//		List<UserBaseQnaCategoryVO> parentList = customerQnaService.getQnaCategoryParentList(vo);
//		List<UserBaseQnaCategoryVO> nameList = customerQnaService.getQnaCategoryNameList(vo);	
		
		ModelAndView mav = new ModelAndView("customer/qna/ask");
		mav.addObject("qnaCategoryList", customerQnaService.getQnaCategoryList(vo));
//		mav.addObject("qnaCategoryParentList", parentList);
//		mav.addObject("qnaCategoryNameList", nameList);
//		System.out.println("Controller" + parentList + " " + nameList);
		
		return mav;
	}
	
	@RequestMapping(value = "/new", method= {RequestMethod.POST})
	public ModelAndView qnaInsertAction(UserBaseQnaVO vo) {
		
		int result = insertQnaService.insertQna(vo);
		ModelAndView mav = new ModelAndView("redirect:/customer/qna.do");
		mav.addObject("result", result);
		return mav;
		
	}
	
	@GetMapping("/qna/list")
	public ModelAndView qnaListPage() {
		ModelAndView mav = new ModelAndView("customer/qna/qna_list");
		return mav;
		
	}
	



	
}
