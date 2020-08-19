package com.nemo.admin.members.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.service.SelectQnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

@Controller
@RequestMapping("/members/qna")
public class QnaController {
		
	@Autowired private QnaService qnaService;
	@Autowired private SelectQnaService selectQnaService;
	
	
	/* QNA 리스트 페이지 */
	@GetMapping("/list")
	public ModelAndView qnaPage(AdminBaseQnaVO vo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna");
		List<AdminBaseQnaVO> qnaList = qnaService.getQnaList(vo);
		mav.addObject("qnaList", qnaList);
		
		return mav;
	}
	
	/* 답변 페이지 */
	@GetMapping("/reply")
	public ModelAndView qnaReplyPage(@RequestParam int qnaNo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply");
		AdminBaseQnaVO qnaVO = selectQnaService.getQna(qnaNo);
		mav.addObject("qnaVO", qnaVO);
		return mav;
	}
	
	/* 답변 리뷰 페이지*/
	@GetMapping("/reply/review")
	public ModelAndView qnaReplyReviewPage(@RequestParam int qnaNo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply_review");
		AdminBaseQnaVO qnaVO = selectQnaService.getQna(qnaNo);
		mav.addObject("qnaVO", qnaVO);
		return mav;
	}
	
	/* 답변 액션 */
	@PostMapping("/reply")
	public ModelAndView qnaReplyAction(AdminBaseQnaVO vo) {	
		qnaService.replyQna(vo);
		ModelAndView mav = new ModelAndView("redirect:/members/qna/list.mdo");	
		System.out.println("답변 액션 : " + vo);
		return mav;
	}
	


	
	
	
}
