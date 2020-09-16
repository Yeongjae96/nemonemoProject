package com.nemo.admin.members.qna.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.service.QnaService;
import com.nemo.admin.members.qna.service.SelectQnaService;
import com.nemo.admin.members.qna.vo.AdminBaseQnaImageVO;
import com.nemo.admin.members.qna.vo.AdminBaseQnaVO;

/**
 * @제목 : 어드민 QNA 리스트와 답변 컨트롤러
 * @패키지이름 : com.nemo.admin.members.qna.controller
 * @파일이름 : QnaController.java
 * @작성일 : 2020. 8. 15
 * @이름 : Yerin
 * @프로그램설명 : 어드민 QNA URL 요청을 맵핑하여 JSP 경로를 반환시켜주는 컨트롤러
 *
 */

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
	

	@GetMapping("/reply")
	public ModelAndView qnaReplyPage(@RequestParam int qnaNo) throws Exception {
		
		//이미지 select 
		List<AdminBaseQnaImageVO> imageList = qnaService.selectImageList(qnaNo);
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply");
		AdminBaseQnaVO qnaVO = selectQnaService.getQna(qnaNo);
		System.out.println(qnaVO);
		mav.addObject("qnaVO", qnaVO);
		mav.addObject("imageList", imageList);
		return mav;
	}
	
	/* 답변 페이지 파일 다운로드 */
	@GetMapping("/reply/filedown")
	public void fileDown(AdminBaseQnaImageVO vo, HttpServletResponse response) throws Exception {

		//String qnaImgFileName = vo.getQnaImgFileName();
		String originalFileName = vo.getQnaImgOriginName();
		String imgType = vo.getQnaImgType();
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray
							(new File("C:\\upload\\qna\\" + originalFileName + "." + imgType));
		System.out.println("오리지널 파일 : " + originalFileName);
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName =\""
							+ URLEncoder.encode(originalFileName, "UTF-8") +"." 
							+ URLEncoder.encode(imgType, "UTF-8")   +"\";");
		System.out.println(response.getHeader(originalFileName));
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	

	}
	

	/* 답변 리뷰 페이지*/
	@GetMapping("/reply/review")
	public ModelAndView qnaReplyReviewPage(@RequestParam int qnaNo) {
		ModelAndView mav = new ModelAndView("members/qna/member_qna_reply_review");
		AdminBaseQnaVO qnaVO = selectQnaService.getQna(qnaNo);
		mav.addObject("qnaVO", qnaVO);
		return mav;
	}
	
	/* 답변글 POST*/
	@PostMapping("/reply")
	public ModelAndView qnaReplyAction(AdminBaseQnaVO vo) {	
		qnaService.replyQna(vo);
		ModelAndView mav = new ModelAndView("redirect:/members/qna/list.mdo");	
		return mav;
	}
	
	
	
	
}
