package com.nemo.admin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.main.service.DailyCountService;
import com.nemo.admin.main.vo.DailyCountVO;
import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

@Controller
public class MainController {
	
	@Autowired private DailyCountService dailyCountService;
	@Autowired private QnaService qnaService;
	
	@GetMapping("/index")
	public ModelAndView index(DailyCountVO vo, AdminBaseQnaVO recentList) {
		ModelAndView mav = new ModelAndView("main");
		int memberCnt = dailyCountService.getDailyMemberCnt(vo);
		int qnaCnt = dailyCountService.getDailyQnaCnt(vo);
		int purchaseCnt = dailyCountService.getDailyPurchaseCnt(vo);
		int productCnt = dailyCountService.getDailyNewProductCnt(vo);
		
		List<AdminBaseQnaVO> recentQnaList = qnaService.getRecentQnaList(recentList);
		
		mav.addObject("memberCnt", memberCnt);
		mav.addObject("qnaCnt", qnaCnt);
		mav.addObject("purchaseCnt", purchaseCnt);
		mav.addObject("productCnt", productCnt);
		mav.addObject("qnaList", recentQnaList);
		
		return mav;
	}
}