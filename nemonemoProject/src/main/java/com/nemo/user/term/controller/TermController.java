package com.nemo.user.term.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.term.service.getTermLocationService;
import com.nemo.user.term.service.getTermPrivacyService;
import com.nemo.user.term.service.getTermServiceService;
import com.nemo.user.term.vo.TermVO;

@Controller
@RequestMapping("/terms")
public class TermController {

	@Autowired private getTermServiceService termService;
	@Autowired private getTermPrivacyService termPrivacy;
	@Autowired private getTermLocationService termLocation;
	
	
	@GetMapping("/service")
	public ModelAndView servicePage(String termTitle) {
		ModelAndView mav = new ModelAndView("term/service");
		TermVO TermVO = termService.getTermService(termTitle);
		mav.addObject("termVO", TermVO);
		
		return mav;
	}
	
	@GetMapping("/privacy")
	public ModelAndView privacyPage(String termTitle) {
		ModelAndView mav = new ModelAndView("term/privacy");
		TermVO TermVO = termPrivacy.getTermPrivacy(termTitle);
		mav.addObject("termVO", TermVO);
		
		return mav;
	}
	
	@GetMapping("/location")
	public ModelAndView locationPage(String termTitle) {
		ModelAndView mav = new ModelAndView("term/location");
		TermVO TermVO = termLocation.getTermLocation(termTitle);
		mav.addObject("termVO", TermVO);
		
		return mav;
	}
}
	