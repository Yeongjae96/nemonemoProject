package com.nemo.admin.sites.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @제목 : 공지사항 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.controller
 * @파일이름 : NoticeController.java
 * @작성일 : 2020. 7. 29.
 * @이름 : Yeong
 * @프로그램설명 : 관리자 공지사항 페이지의 경로를 잡아주는 컨트롤러
 * == 수정 정보 ==
 *
 * DATE				 AUTHOR			NOTE
 * -------			  --------		-------------	
 * 20. 07.29 			김영재				초기설정
 */
@Controller
public class NoticeController {
	
	@RequestMapping(value = "/sites/notice", method= {RequestMethod.GET})
	public ModelAndView noticePage() {
		return new ModelAndView("sites/site_notice_list");
	}
	
	@RequestMapping(value = "/sites/notice_edit", method= {RequestMethod.GET})
	public ModelAndView noticeEdit() {
		return new ModelAndView("sites/site_notice_edit");
	}
	
	@RequestMapping(value = "/sites/notice_edit", method= {RequestMethod.POST})
	public ModelAndView noticeEditAction() {
		
		//Service 
		
		return new ModelAndView("redirect:notice.mdo");
	}
}
