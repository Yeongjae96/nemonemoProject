package com.nemo.admin.sites.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nemo.admin.sites.notice.service.DeleteNoticeService;
import com.nemo.admin.sites.notice.service.InsertNoticeService;
import com.nemo.admin.sites.notice.service.SelectNoticeListService;
import com.nemo.admin.sites.notice.service.SelectNoticeService;
import com.nemo.admin.sites.notice.service.UpdateNoticeService;
import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;

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
@RequestMapping("/sites/notice")
public class NoticeController {
	
	@Autowired private InsertNoticeService insertNoticeService;
	@Autowired private SelectNoticeListService selectNoticeListService;
	@Autowired private DeleteNoticeService deleteNoticeService;
	@Autowired private SelectNoticeService selectNoticeService;
	@Autowired private UpdateNoticeService updateNoticeService;
	
	@RequestMapping(value = "/list", method= {RequestMethod.GET})
	public ModelAndView noticePage(AdminBaseNoticeVO vo) {
	
		ModelAndView mav = new ModelAndView("sites/notice/site_notice_list");
		List<AdminBaseNoticeVO> data = selectNoticeListService.getNoticeList(vo);
		mav.addObject("noticeList", data);
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.GET})
	public ModelAndView noticeEdit(@RequestParam int noticeNo) {
		ModelAndView mav = new ModelAndView("sites/notice/site_notice_edit");
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.POST})
	public ModelAndView noticeEditAction(AdminBaseNoticeVO vo, RedirectAttributes redirectAttributes) {
		//Service 
		int result = updateNoticeService.updateNotice(vo);
		addWorkResult(result, "edit", redirectAttributes);
		return new ModelAndView("redirect:/sites/notice/list.mdo");
	}
	
	@RequestMapping(value = "/new", method= {RequestMethod.POST})
	public ModelAndView noticeInsertAction(AdminBaseNoticeVO vo, RedirectAttributes redirectAttributes) {
		
		int result = insertNoticeService.insertNotice(vo);
		addWorkResult(result, "new", redirectAttributes);
		ModelAndView mav = new ModelAndView("redirect:/sites/notice/list.mdo");
		return mav;
	}
	
	@RequestMapping(value = "/delete", method= {RequestMethod.POST})
	public ModelAndView noticeDeleteAction(@RequestParam int noticeNo, RedirectAttributes redirectAttributes) {
		int result = deleteNoticeService.deleteNotice(noticeNo);
		
		addWorkResult(result, "delete", redirectAttributes);
		
		ModelAndView mav = new ModelAndView("redirect:/sites/notice/list.mdo");
		return mav;
	}
	
	@GetMapping("/new")
	public ModelAndView noticeNewPage() {
		ModelAndView mav = new ModelAndView("sites/notice/site_notice_new");
		return mav;
	}
	
	
	@PostMapping("/flag")
	public @ResponseBody int delFlag(AdminBaseNoticeVO vo) {
		return updateNoticeService.updateDelFl(vo);
	}
	
	@GetMapping("/getNoticeJson")
	public @ResponseBody AdminBaseNoticeVO getNoticeJson(@RequestParam int noticeNo) {
		return selectNoticeService.getNotice(noticeNo);
	}

	private void addWorkResult(int result, String workName, RedirectAttributes redirectAttributes) {
		String work = "";
		switch(workName) {
		case "delete":
			work = result > 0 ? "delete:success" : "delete:fail";
			break;
		case "new":
			work = result > 0? "new:success" : "new:fail";
			break;
		case "edit":
			work = result > 0 ?  "edit:success" : "edit:fail";
			break;
		default:
		}
		redirectAttributes.addFlashAttribute("work", work);
	}
	
}
