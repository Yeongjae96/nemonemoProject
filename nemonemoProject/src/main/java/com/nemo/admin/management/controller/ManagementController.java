package com.nemo.admin.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.management.service.InsertAdminService;
import com.nemo.admin.management.vo.ManagementVO;

/**
 * @제목 : 관리자 계정 컨트롤러
 * @패키지이름 : com.nemo.admin.management.controller
 * @파일이름 : ManagementController.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yerin, Dong, Seoungil
 * @프로그램설명 : 관리자 페이지의 경로를 잡아주는 컨트롤러
 * == 수정 정보 ==
 *
 * DATE				 AUTHOR			NOTE
 * -------			--------		-------------	
 * 20. 07.30 		    손예린			초기설정
 */


@Controller
public class ManagementController {

	@Autowired
	private InsertAdminService insertAdminService;

	 // 내가 받고 싶은 페이지를 띄우는 GET 방식. /management/signup 을 쳤을 때 GET방식을 
	 // 이용해서 서버에서 management/ad_sign_up.jsp 띄워줌 
	@RequestMapping(value = "/management/signup", method = { RequestMethod.GET })
	public ModelAndView managementPageTest(ManagementVO vo) {

		ModelAndView mav = new ModelAndView("management/ad_sign_up");
		return mav;
	
	}

	@RequestMapping(value = "/management/signin", method = { RequestMethod.GET })
	public ModelAndView managementPage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_sign_in");
		return mav;

	}

	@RequestMapping(value = "/management/signup", method = { RequestMethod.POST })
	public ModelAndView signupAction(ManagementVO vo) {
		System.out.println("Controller : " + vo);
		insertAdminService.insertAdmin(vo);
		ModelAndView mav = new ModelAndView("redirect:/management/signin.mdo");
		return mav;


	}


}
