package com.nemo.admin.members.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.members.member.service.MemberService;
import com.nemo.admin.members.member.vo.AdminBaseMemberVO;
import com.nemo.admin.members.member.vo.TermsCheckedVO;
import com.nemo.user.purchases.vo.PurchasesVO;
import com.nemo.user.pusrchases.service.PurchaseService;

/**
 * @제목 : 관리자 자주묻는 질문 카테고리 컨트롤러
 * @패키지이름 : com.nemo.admin.members.member.controller
 * @파일이름 : MemberInfoController.java
 * @작성일 : 2020. 08. 17
 * @이름 : Yerin
 * @프로그램설명 : 어드민 회원관리에 대한 url 요청을 처리하고 응답해준다.
 * 
 */

@Controller
@RequestMapping("/members")
public class MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired private PurchaseService purchaseService;
	
	@GetMapping("/list")
	public ModelAndView listPage(AdminBaseMemberVO vo) {
		ModelAndView mav = new ModelAndView("members/member/member_list");
		List<AdminBaseMemberVO> members = memberService.getMemberList(vo);
		mav.addObject("memberList", members);
		return mav;
	}
	
	@GetMapping("/info")
	public ModelAndView infoPage(@RequestParam int userNo) {
		ModelAndView mav = new ModelAndView("members/member/member_info");
		AdminBaseMemberVO memberVO = memberService.getMember(userNo);
		List<TermsCheckedVO> termsVO = memberService.getTerms(userNo);
		List<PurchasesVO> purchaseVO = purchaseService.getUserPurchases(userNo);
		mav.addObject("memberVO", memberVO);
		mav.addObject("termsVO", termsVO);
		mav.addObject("purchaseList", purchaseVO);
		return mav;
	}
}
