package com.nemo.admin.members.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.qna.service.QnaCategoryService;
import com.nemo.admin.members.qna.vo.QnaCategoryVO;

/**
 * @제목 : 관리자 자주묻는 질문 카테고리 컨트롤러
 * @패키지이름 : com.nemo.admin.members.qna.controller
 * @파일이름 : QnaCategoryController.java
 * @작성일 : 2020. 08. 08
 * @이름 : Yerin
 * @프로그램설명 : 1:1문의 카테고리에 대한 url 요청을 처리하고 응답해준다.
 * 
 */
@Controller
@RequestMapping("members/qna/category")
public class QnaCategoryController {
	
	@Autowired
	public QnaCategoryService qnaCategoryService;
	
	@GetMapping("/list")
	public ModelAndView qnaCategoryPage(@RequestParam(required = false, defaultValue="Y") String qnaCategoryUseFlMode) {
		
		ModelAndView mav = new ModelAndView("members/qna/category/member_qna_category_list");
		List<QnaCategoryVO> qnaCategoryList = qnaCategoryService.getQnaCategoryList(qnaCategoryUseFlMode);
		mav.addObject("qnaCategoryList", qnaCategoryList);
		
		return mav;
	}
	
	@GetMapping("/listJson")
	@ResponseBody
	public List<QnaCategoryVO> qnaCategoryListJSON() {
		return qnaCategoryService.getQnaCategoryList("Y");
	}
	
	/* 카테고리 추가 */
	@PostMapping("/new")
	public ModelAndView qnaCategoryNewAction(QnaCategoryVO vo) {
		qnaCategoryService.insertQnaCategory(vo);
		System.out.println("qna 추가 : " + vo);
		ModelAndView mav = new ModelAndView("redirect:/members/qna/category/list.mdo");
		return mav;
	}
	
	/* 카테고리 수정 */
	@GetMapping("/edit")
	@ResponseBody
	public QnaCategoryVO qnaCategoryEditJSON(@RequestParam int qnaCategorySq) {
		System.out.println("수정할 번호 : " + qnaCategorySq);
		return qnaCategoryService.getQnaCategory(qnaCategorySq);
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public int qnaCategoryEditPostJSON(QnaCategoryVO vo) {
		System.out.println("수정될 ROW : " + vo);
		return qnaCategoryService.updateQnaCategory(vo);
	}
	
	/* 카테고리 삭제 */
	@PostMapping("/delete")
	@ResponseBody
	public int qnaCategoryDeletePostJSON(@RequestParam int qnaCategorySq) {
		return qnaCategoryService.deleteQnaCategory(qnaCategorySq);
	}
	
	


}
