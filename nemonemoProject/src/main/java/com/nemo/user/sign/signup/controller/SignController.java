package com.nemo.user.sign.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.common.ContextUtil;
import com.nemo.user.sign.signup.service.UserService;
import com.nemo.user.sign.signup.vo.UserVO;

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
	public ModelAndView signinAction(UserVO vo) {
		System.out.println(vo);
		int result = userService.login(vo);
		System.out.println("session : "+ContextUtil.getAttrFromSession("userPhone"));
		
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	@GetMapping("/signup")
	public ModelAndView signupPage() {
		ModelAndView mav = new ModelAndView("sign/signup");
		return mav;
	}
	
	@RequestMapping(value = "/signup", method= {RequestMethod.POST})
	public ModelAndView signupAction(UserVO vo) {
		userService.insertUser(vo);
		
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	
}
