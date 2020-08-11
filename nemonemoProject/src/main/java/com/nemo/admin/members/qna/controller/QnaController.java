package com.nemo.admin.members.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

@Controller
@RequestMapping("/members/qna")
public class QnaController {
		
	@Autowired private QnaService qnaService;
	
	/* QNA 페이지 */
	@GetMapping("/list")
	public ModelAndView qnaPage(AdminBaseQnaVO vo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna");
		List<AdminBaseQnaVO> qnaList = qnaService.getQnaList(vo);
		mav.addObject("qnaList", qnaList);
		
		return mav;
	}
	
	/* QNA 답변 페이지 */
	@GetMapping("/reply")
	public ModelAndView qnaReplyPage(AdminBaseQnaVO vo){
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply");
		mav.addObject("customerQna", qnaService.getQna(vo));
		return mav;
	}
	
	@PostMapping("/replyaction")
	public ModelAndView qnaReplyAction(AdminBaseQnaVO vo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna");
		return mav;
	}
	
	

	
	
	
}
