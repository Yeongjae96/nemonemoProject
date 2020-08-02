package com.nemo.admin.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.management.service.GetAdminListService;
import com.nemo.admin.management.service.InsertAdminService;
import com.nemo.admin.management.service.LoginAdminService;
import com.nemo.admin.management.vo.ManagementVO;
import com.nemo.admin.sites.notice.vo.NoticeVO;


/**
 * 
 * 
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
 * 
 * 
 */


@Controller
public class ManagementController {

	@Autowired private InsertAdminService insertAdminService;
	@Autowired private LoginAdminService loginAdminService;
	@Autowired private GetAdminListService getAdminListService;

	/* 회원가입  */
	@RequestMapping(value = "/management/signup", method = { RequestMethod.GET })
	public ModelAndView signupPage(ManagementVO vo) {

		ModelAndView mav = new ModelAndView("management/ad_signup");
		return mav;
	}
	
	/* 로그인  */
	@RequestMapping(value = "/management/login", method = { RequestMethod.GET })
	public ModelAndView loginPage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_login");
		return mav;

	}

	/* 메인화면 띄우기 */
	@RequestMapping(value = "/management/adminmain", method = { RequestMethod.GET })
	public ModelAndView managementMainPage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_main");
		return mav;
	}
	
	/* 어드민 프로필 페이지 띄우기 */
	@RequestMapping(value ="/management/profile", method = {RequestMethod.GET})
	public ModelAndView profilePage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_profile");
		List<ManagementVO> data = getAdminListService.getAdminList(vo);
		mav.addObject("adminList", data);
		return mav;
		
	}	
	
	@RequestMapping(value = "/management/signup", method = { RequestMethod.POST })
	public ModelAndView signupAction(ManagementVO vo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setAdminPw(encoder.encode(vo.getAdminPw()));
		System.out.println("회원가입 정보 : " + vo);
		insertAdminService.insertAdmin(vo);
		ModelAndView mav = new ModelAndView("redirect:/management/login.mdo");
		return mav;
	}

	/* 로그인하기 */
	@RequestMapping(value = "/management/login", method = RequestMethod.POST)
	public ModelAndView loginAdmin(ManagementVO vo) {
		System.out.println("Controller : " + vo);
		loginAdminService.loginAdmin(vo);
		ModelAndView mav = new ModelAndView("redirect:/management/adminmain.mdo");
		return mav;
	}
	

}
