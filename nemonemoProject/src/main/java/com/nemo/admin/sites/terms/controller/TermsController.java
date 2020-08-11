package com.nemo.admin.sites.terms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.terms.service.GetTermsListService;
import com.nemo.admin.sites.terms.service.GetTermsService;
import com.nemo.admin.sites.terms.service.InsertTermsService;
import com.nemo.admin.sites.terms.service.RenewTermsService;
import com.nemo.admin.sites.terms.service.UpdateTermsService;
import com.nemo.admin.sites.terms.vo.TermsVO;

/**
 * @제목 : 약관 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.terms.controller
 * @파일이름 : TermsController.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yeong
 * @프로그램설명 : /sites/terms 경로에 대한 컨트롤러
 *  
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 * 	20.07.30 	김영재			terms 초기설정
 *  20.08.06	이혜인			삭제여부 기능 추가
 *  20.08.09	이혜인			갱신 기능 추가
 */
@Controller
@RequestMapping("/sites/terms")
public class TermsController {
	
	@Autowired private InsertTermsService insertTermsService;
	@Autowired private GetTermsListService getTermsListService;
	@Autowired private GetTermsService getTermsService;
	@Autowired private UpdateTermsService updateTermsService;
	@Autowired private RenewTermsService renewTermsService;
	
	
	@GetMapping("/list")
	public ModelAndView termsListPage() {
		
		List<TermsVO> termsList = getTermsListService.getTermsList();
				
		ModelAndView mav = new ModelAndView("sites/terms/site_terms_list");
		mav.addObject("termsList", termsList);
		return mav;
	}
	
	@GetMapping("/new")
	public ModelAndView termsNewPage() {
		ModelAndView mav = new ModelAndView("sites/terms/site_terms_new");
		return mav;
	}
	

	@RequestMapping(value = {"/new", "/renew"}, method= {RequestMethod.POST})
	public ModelAndView TermsInsertAction(TermsVO vo) {
		
		renewTermsService.renewTerms(vo);
		int result = insertTermsService.insertTerms(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/terms/list.mdo");
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.GET})
	public ModelAndView TermsEdit(@RequestParam int termsNo) {
		ModelAndView mav = new ModelAndView("sites/terms/site_terms_edit");

		TermsVO TermsVO = getTermsService.getTerms(termsNo);
		mav.addObject("termsVO", TermsVO);
		
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.POST})
	public ModelAndView TermsEditAction(TermsVO vo) {
		updateTermsService.updateTerms(vo);
		return new ModelAndView("redirect:/sites/terms/list.mdo");
	}
	
	@RequestMapping(value = "/renew", method= {RequestMethod.GET})
	public ModelAndView TermsRenew(@RequestParam int termsNo) {		
		ModelAndView mav = new ModelAndView("sites/terms/site_terms_renew");
		TermsVO TermsVO = getTermsService.getTerms(termsNo);
		mav.addObject("termsVO", TermsVO);
		return mav;
	}
}