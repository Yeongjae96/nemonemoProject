package com.nemo.user.talk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.talk.vo.UserTalkContantVO;

@Controller
@RequestMapping("/talk")
public class TalkController {
	
	@GetMapping("/list")
	public ModelAndView talkListPage() {
		ModelAndView mav = new ModelAndView("talk/talk_list");
		return mav;
	}
	
	@GetMapping("/user/{userNo}")
	public ModelAndView talkUserPage(@PathVariable int userNo, UserTalkContantVO vo) {
		ModelAndView mav = new ModelAndView("talk/talk_user");
		return mav;
	}
	
}
