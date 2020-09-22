package com.nemo.admin.members.terms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.terms.service.GetTermsHistListService;
import com.nemo.admin.members.terms.service.GetTermsHistService;
import com.nemo.admin.members.terms.vo.TermsHistVO;



/**
 * @제목 : 약관내역 컨트롤러
 * @패키지이름 : com.nemo.admin.members.terms.controller
 * @파일이름 : TermsHistController.java
 * @작성일 : 2020. 8. 10.
 * @이름 : Hyein
 * @프로그램설명 : 약관내역 경로에 대한 컨트롤러
 *  
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 *  20.08.10	이혜인			초기설정
 */

@Controller
@RequestMapping("/members/terms")
public class TermsHistController {
	
	@Autowired private GetTermsHistListService getTermsHistListService;
	@Autowired private GetTermsHistService getTermsHistService;
	
	
	@GetMapping("/list")
	public ModelAndView termsHistListPage() {
		
		List<TermsHistVO> termsHistList = getTermsHistListService.getTermsHistList();
				
		ModelAndView mav = new ModelAndView("members/terms/member_term");
		mav.addObject("termsHistList", termsHistList);
		return mav;
	}
	
	
	@RequestMapping(value = "/edit", method= {RequestMethod.GET})
	public ModelAndView TermsHistEdit(@RequestParam int termsHistNo) {
		ModelAndView mav = new ModelAndView("member_term_content");
		TermsHistVO TermsHistVO = getTermsHistService.getTermsHist(termsHistNo);
		mav.addObject("termsHistVO", TermsHistVO);
		
		return mav;
	}
}