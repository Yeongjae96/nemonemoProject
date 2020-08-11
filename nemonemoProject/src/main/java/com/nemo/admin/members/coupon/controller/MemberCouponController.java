//package com.nemo.admin.members.coupon.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.nemo.admin.members.coupon.service.GetMemberCouponListService;
//import com.nemo.admin.members.coupon.service.GetMemberCouponService;
//import com.nemo.admin.members.coupon.vo.MemberCouponVO;
//
//
//
///**
// * @제목 : 회원 쿠폰 관리 컨트롤러
// * @패키지이름 : com.nemo.admin.members.coupon.controller
// * @파일이름 :MemberCouponController.java
// * @작성일 : Aug 11, 2020
// * @이름 : Hyein
// * @프로그램설명 : 관리자 회원 쿠폰관리 페이지의 경로를 잡아주는 컨트롤러
// */
//
//@Controller
//@RequestMapping("/members/coupon")
//public class MemberCouponController {
//	
//	@Autowired private GetMemberCouponListService getMemberCouponListService;
//	@Autowired private GetMemberCouponService getMemberCouponService;
//	
//	@GetMapping("/list")
//	public ModelAndView memberCouponListPage() {
//		
//		List<MemberCouponVO> memberCouponList = getMemberCouponListService.getMemberCouponList();
//				
//		ModelAndView mav = new ModelAndView("members/coupon/member_coupon");
//		mav.addObject("memberCouponList", memberCouponList);
//		System.out.println(" 리턴 데이터2 : "+ memberCouponList);
//		return mav;
//	}
//	
//	
////	@RequestMapping(value = "/edit", method= {RequestMethod.GET})
////	public ModelAndView TermsHistEdit(@RequestParam int memberCouponNo) {
////		ModelAndView mav = new ModelAndView("members/coupon/member_coupon");
////		MemberCouponVO memberCouponVO = getMemberCouponService.getMemberCoupon(memberCouponNo);
////		mav.addObject("memberCouponVO", memberCouponVO);
////		
////		return mav;
////	}
//}