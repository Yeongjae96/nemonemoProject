package com.nemo.user.customer.qna.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.vo.UserQnaResVO;
import com.nemo.common.paging.PageVO;
import com.nemo.common.util.ContextUtil;
import com.nemo.user.customer.qna.service.CustomerQnaCategoryService;
import com.nemo.user.customer.qna.service.CustomerQnaService;
import com.nemo.user.customer.qna.service.InsertQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaCategoryVO;
import com.nemo.user.customer.qna.vo.UserBaseQnaVO;
import com.nemo.user.customer.qna.vo.UserNewQnaVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

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
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private CustomerQnaCategoryService customerQnaCategoryService;
	@Autowired
	private InsertQnaService insertQnaService;
	@Autowired
	private CustomerQnaService customerQnaService;
	
	
	@GetMapping("/qna")
	public ModelAndView qnaPage(UserBaseQnaCategoryVO vo) {
		ModelAndView mav = new ModelAndView("customer/qna/ask");
		mav.addObject("qnaCategoryList", customerQnaCategoryService.getQnaCategoryList(vo));
		return mav;
	}
	
	
	/* 사용자가 QNA 등록 */
	@PostMapping("/newQuestionJson")
	public @ResponseBody int newAction(UserNewQnaVO vo) {
		return insertQnaService.insertQna(vo);
	}
	
	
	/* QNA 리스트에 뿌려주기 */	
	@GetMapping("/qna/list")
	public ModelAndView qnaListPage(UserBaseQnaVO vo,
			@RequestParam(value = "pageNo", defaultValue="1")int pageNo, //시작번호
			@RequestParam(value = "pageSize", defaultValue="5")int pageSize // 한페이지에 보여줄 갯수
			) {		
		ModelAndView mav = new ModelAndView("customer/qna/qna_list");
		UserBaseVO userInfo = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		vo.setQnaRegId(userInfo.getUserNo());
		System.out.println("컨트롤러 : " + vo);
		 
		PageVO pageVO = new PageVO();
		pageVO.setPageNo(pageNo);
		pageVO.setPageSize(pageSize);
		
		UserQnaResVO res = customerQnaService.selectQnaList(vo, pageVO);
		mav.addObject("vo", res);
		return mav;
		
	}
	


	
	
}
