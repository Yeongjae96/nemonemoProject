package com.nemo.user.talk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.talk.service.UserTalkService;
import com.nemo.user.talk.vo.UserTalkContactParamVO;
import com.nemo.user.talk.vo.UserTalkContactResVO;

@Controller
@RequestMapping("/talk")
public class TalkController {
	
	@Autowired
	private UserTalkService userTalkService;
	
	@GetMapping("/list")
	public ModelAndView talkListPage() {
		ModelAndView mav = new ModelAndView("talk/talk_list");
		return mav;
	}
	
	@GetMapping("/user/{userNo}")
	public ModelAndView talkUserPage(@PathVariable("userNo") int opponentUserNo) {
		ModelAndView mav = new ModelAndView("talk/talk_user");
		userTalkService.createTalk(opponentUserNo);
		return mav;
	}
	
	@GetMapping("/user/{userNo}/contact")
	@ResponseBody
	public UserTalkContactResVO getContactData(@PathVariable("userNo") int userOpponentNo, @RequestParam("productNo") int productNo) {
		UserTalkContactParamVO paramVO = new UserTalkContactParamVO(productNo, userOpponentNo);
		UserTalkContactResVO result = userTalkService.getContactVO(paramVO);
		if(result == null) {
			result = new UserTalkContactResVO();
			result.setResult("notFoundUserSession");
		}
		return result;
	}
	
	/* @GetMapping("/user/{userNo}/msg") */
	
}
