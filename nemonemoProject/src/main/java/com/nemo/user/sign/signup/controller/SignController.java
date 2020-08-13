package com.nemo.user.sign.signup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.nemo.user.sign.signup.service.UserService;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Controller
@RequestMapping("/sign")
public class SignController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/signin")
	public ModelAndView signinPage() {
		ModelAndView mav = new ModelAndView("sign/signin");
		return mav;
	}

	@PostMapping("/signin")
	public ModelAndView signinAction(UserBaseVO vo, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.toString());
		// 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 세션
		HttpSession session = req.getSession();
		// 로그인
		UserBaseVO user = userService.loginUser(vo);
		// 암호화된 비밀번호 매칭
		boolean pwdMatch = encoder.matches(vo.getUserPw(), user.getUserPw());
		// 조건문
		// 로그인값이 있고 암호화된 비밀번호가 있고 사용가능여부가 Y상태여야 로그인가능
		System.out.println(user.getUserEmail());
		if (user != null && pwdMatch == true) {
			session.setAttribute("user", user);
			mav.setViewName("redirect:/");
			return mav;
		} else {
			session.setAttribute("user", null);
			mav.setViewName("redirect:/");
			return mav;
		}
	}
	
	@GetMapping("/signup")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView("sign/signup");
		return mav;
	}
	
	@RequestMapping(value = "/signup", method= {RequestMethod.POST})
	public ModelAndView signupAction(UserBaseVO vo) {
		//암호화 진행
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		try {
			vo.setUserPw(encoder.encode(vo.getUserPw()));
			userService.insertUser(vo);
			ModelAndView mav = new ModelAndView("redirect:/");
			return mav;
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("redirect:/sign/signup.do");
			return mav;
		}
	}
	
	//AJAX 메서드 앞에 어노테이션 @ResponseBody 추가
	@ResponseBody
	@RequestMapping(value ="/signup/idUsercheck", method = {RequestMethod.POST}) 
	public int UserIdCheck(UserBaseVO vo) {
	
		System.out.println("아이디 체크 컨트롤러 시작");		
		String id = vo.getUserEmail();
		System.out.println("어드민 아이디 " + id);
		int idChecked = userService.idUsercheck(vo.getUserEmail());
		System.out.println("Controller : " + idChecked); 
	
		return idChecked; // 이 컨트롤러의 return을 ajax data로..!!
		
	}
	
	
	@GetMapping("/info")
	public ModelAndView userinfoPage() {
		ModelAndView mav = new ModelAndView("info/userinfo");
		return mav;
	}
	
	@PostMapping("/updateUser")
	public ModelAndView UpdateAction(UserBaseVO vo,HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		//비밀번호 암호화를 시키기위해 부름
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//재입력한 비밀번호 암호화
		vo.setUserPw(encoder.encode(vo.getUserPw()));
		//유저 수정하기
		userService.updateUser(vo);
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
	@GetMapping("/setting")
	public ModelAndView userSettingPage() {
		ModelAndView mav = new ModelAndView("settings/setting");
		return mav;
	}
	
	@GetMapping("/withdraw")
	public ModelAndView userWithdrawPage() {
		ModelAndView mav = new ModelAndView("withdraw/withdraw");
		return mav;
	}
	
}
