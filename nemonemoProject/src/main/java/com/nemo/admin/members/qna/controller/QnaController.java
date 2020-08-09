package com.nemo.admin.members.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/members/qna")
public class QnaController {
		
	
//	@Autowired
//	private QnaService qnaService;
	
	/* QNA 페이지 */
	@GetMapping("/list")
	public ModelAndView qnaPage() {
		ModelAndView mav = new ModelAndView("members/qna/member_qna");
		return mav;
	}
	
	/* QNA 답변 페이지 */
	@GetMapping("/reply")
	public ModelAndView qnaReplyPage(){
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply");
		return mav;
	}
	
	

	
	
	
}
