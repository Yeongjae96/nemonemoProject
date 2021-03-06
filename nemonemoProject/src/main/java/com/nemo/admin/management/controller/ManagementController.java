package com.nemo.admin.management.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nemo.admin.management.service.DeleteAdminService;
import com.nemo.admin.management.service.IdCheckService;
import com.nemo.admin.management.service.InsertAdminService;
import com.nemo.admin.management.service.LoginAdminService;
import com.nemo.admin.management.service.SelectAdminListService;
import com.nemo.admin.management.vo.ManagementVO;


/**
 * 
 * @제목 : 관리자 계정 컨트롤러
 * @패키지이름 : com.nemo.admin.management.controller
 * @파일이름 : ManagementController.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Yerin, Dong, Seoungil
 * @프로그램설명 : 관리자 페이지의 경로를 잡아주는 컨트롤러
 * 
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
	
	
	/* 어드민 프로필 페이지 띄우기 */
	@RequestMapping(value ="/profile", method = {RequestMethod.GET})
	public ModelAndView profilePage(ManagementVO vo) {
		ModelAndView mav = new ModelAndView("management/ad_profile");
		List<ManagementVO> data = selectAdminListService.getAdminList(vo);
		mav.addObject("adminList", data);
		return mav;
	}	
	
	/* 회원가입 post */
	@RequestMapping(value = "/signup", method = { RequestMethod.POST })
	public ModelAndView signupAction(ManagementVO vo) {
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setAdminPw(encoder.encode(vo.getAdminPw()));
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
	


	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginAdminaction(ManagementVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		// 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 사용가능여부 체크
		String check = "Y";
		// 세션
		HttpSession session = req.getSession();
		System.out.println(req.getContextPath());
		// 로그인
		// 예외처리 보함
		try {
			ManagementVO login = loginAdminService.loginAdmin(vo);
			// 암호화된 비밀번호 매칭
			boolean pwdMatch = encoder.matches(vo.getAdminPw(), login.getAdminPw());
			// 조건문
			// 로그인값이 있고 암호화된 비밀번호가 있고 사용가능여부가 Y상태여야 로그인가능
			if (login != null && pwdMatch == true && login.getAdminUse().equals(check)) {
				session.setAttribute("admin", login);
				System.out.println("세션값 : " + session.getAttribute("admin"));
				return "redirect:/index.mdo";
			} else {
				session.setAttribute("admin", null);
				rttr.addFlashAttribute("msg", false);
				return "redirect:/management/login.mdo";
			}
		} catch (Exception e) {
			return "redirect:/management/login.mdo";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value ="/signup/idcheck", method = {RequestMethod.POST}) 
	public int adminIdCheck(ManagementVO vo) {	
		String id = vo.getAdminId();
		int idChecked = idCheckService.idCheck(id); 
		return idChecked; 
		
	}

	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/management/login.mdo");
		return mv;
	}

}


