package com.nemo.admin.sites.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.notice.service.InsertNoticeService;
import com.nemo.admin.sites.notice.service.SelectNoticeListService;
import com.nemo.admin.sites.notice.vo.NoticeVO;

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
	
	@Autowired
	private InsertNoticeService insertNoticeService;
	@Autowired
	private SelectNoticeListService selectNoticeListService;
	
	/**
	 * @메소드이름 : noticePage
	 * @작성일 : 2020. 7. 29.
	 * @작성자 : Yeong
	 * @Param :
	 * @param vo
	 * @return :  
	 * @Method설명 : 
	 *
	 */
	@RequestMapping(value = "/sites/notice", method= {RequestMethod.GET})
	public ModelAndView noticePage(NoticeVO vo) {
	
		ModelAndView mav = new ModelAndView("sites/site_notice_list");
		List<NoticeVO> data = selectNoticeListService.getNoticeList(vo);
		mav.addObject("noticeList", data);
		System.out.println("controller : " + mav.getModel().get("noticeList"));
		return mav;
	}
	
	@RequestMapping(value = "/sites/notice/edit", method= {RequestMethod.GET})
	public ModelAndView noticeEdit() {
		return new ModelAndView("sites/site_notice_edit");
	}
	
	@RequestMapping(value = "/sites/notice/edit", method= {RequestMethod.POST})
	public ModelAndView noticeEditAction() {
		
		//Service 
		
		return new ModelAndView("redirect:/sites/notice.mdo");
	}
	
	@RequestMapping(value = "/sites/notice/new", method= {RequestMethod.POST})
	public ModelAndView noticeInsertAction(NoticeVO vo) {
		
		int result = insertNoticeService.insertNotice(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/notice.mdo");
		mav.addObject("result", result);
		return mav;
	}
}
