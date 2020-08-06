package com.nemo.admin.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.management.service.DeleteAdminService;
import com.nemo.admin.management.service.IdCheckService;
import com.nemo.admin.management.service.InsertAdminService;
import com.nemo.admin.management.service.LoginAdminService;
import com.nemo.admin.management.service.SelectAdminListService;
import com.nemo.admin.management.vo.ManagementVO;


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
 * 20. 08.02		    손예린			비밀번호 찾기 modelAndView 추가 및 로그인 암호화
 * 					    손예린			profile READ, UPDATE, DELETE
 * 
 */


@Controller
@RequestMapping("/management")
public class ManagementController {

	@Autowired private InsertAdminService insertAdminService;
	@Autowired private LoginAdminService loginAdminService;
	@Autowired private SelectAdminListService selectAdminListService;
	@Autowired private DeleteAdminService deleteAdminService;
	@Autowired private IdCheckService idCheckService;

	/* 회원가입  */
	@RequestMapping(value = "/signup", method = { RequestMethod.GET })
	public ModelAndView signupPage(ManagementVO vo) {

		ModelAndView mav = new ModelAndView("management/ad_signup");
		return mav;
	}
	
	/* 로그인  */
	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public ModelAndView loginPage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_login");
		return mav;

	}

	/* 메인화면 띄우기 */
	@RequestMapping(value = "/adminmain", method = { RequestMethod.GET })
	public ModelAndView managementMainPage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_main");
		return mav;
	}
	
	/* 비밀번호 찾기 띄우기 */
	@RequestMapping(value ="/forgotpw", method = {RequestMethod.GET})
	public ModelAndView forgotpwPage() {
		ModelAndView mav = new ModelAndView("management/ad_forgot_password");
		return mav;
	}
	
	/* 어드민 프로필 페이지 띄우기 */
	@RequestMapping(value ="/profile", method = {RequestMethod.GET})
	public ModelAndView profilePage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_profile");
		List<ManagementVO> data = selectAdminListService.getAdminList(vo);
		mav.addObject("adminList", data);
		return mav;
		
	}	
	
	@RequestMapping(value = "/signup", method = { RequestMethod.POST })
	public ModelAndView signupAction(ManagementVO vo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setAdminPw(encoder.encode(vo.getAdminPw()));
		System.out.println("회원가입 정보 : " + vo);
		insertAdminService.insertAdmin(vo);
		ModelAndView mav = new ModelAndView("redirect:/management/login.mdo");
		return mav;
	}
	
	@RequestMapping(value ="/profile/delete", method= {RequestMethod.POST})
	public ModelAndView adminDeleteAction(ManagementVO vo) {
		deleteAdminService.deleteAdmin(vo);
		System.out.println("활동중지 : " + vo);
		ModelAndView mav = new ModelAndView("redirect:/management/profile.mdo");
		return mav;
	}
	

	
	/* 로그인 중복검사 테스트 - 예린  */
	//AJAX 메서드 앞에 어노테이션 @ResponseBody 추가
	@ResponseBody
	@RequestMapping(value ="/signup/idcheck", method = {RequestMethod.POST}) 
	public int adminIdCheck(ManagementVO vo) {
		
		System.out.println("아이디 체크 컨트롤러 시작");		
		String id = vo.getAdminId(); 
		System.out.println("getParam " + id);
		int idChecked = idCheckService.idCheck(id);
		System.out.println("Controller : " + idChecked); 
	
		return idChecked; // 이 컨트롤러의 return을 ajax data로..!!
		
	}
		
	/* 로그인하기 */
	@PostMapping("/login")
	public ModelAndView loginAdmin(ManagementVO vo) {
		System.out.println("Controller : " + vo);
		loginAdminService.loginAdmin(vo);
		ModelAndView mav = new ModelAndView("redirect:/management/adminmain.mdo");
		return mav;
	}
	


}


