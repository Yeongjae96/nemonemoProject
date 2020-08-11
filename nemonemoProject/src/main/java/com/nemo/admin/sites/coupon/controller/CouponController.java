package com.nemo.admin.sites.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.coupon.service.DeleteCouponService;
import com.nemo.admin.sites.coupon.service.InsertCouponService;
import com.nemo.admin.sites.coupon.service.SelectCouponListService;
import com.nemo.admin.sites.coupon.service.SelectCouponService;
import com.nemo.admin.sites.coupon.service.UpdateCouponService;
import com.nemo.admin.sites.coupon.vo.CouponVO;

/**
 * @제목 : 쿠폰관리 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.coupon.controller
 * @파일이름 : CouponController.java
 * @작성일 : 2020. 7. 30.
 * @이름 : Hyein
 * @프로그램설명 : 관리자 쿠폰관리 페이지의 경로를 잡아주는 컨트롤러
 * == 수정 정보 ==
 *
 * DATE				 AUTHOR			NOTE
 * -------			--------		-------------	
 * 20. 07.30 		이혜인			초기설정
 */

@Controller
@RequestMapping("/sites/coupon")
public class CouponController {
	
	@Autowired private InsertCouponService insertCouponService;
	@Autowired private SelectCouponListService selectCouponListService;
	@Autowired private DeleteCouponService deleteCouponService;
	@Autowired private SelectCouponService selectCouponService;
	@Autowired private UpdateCouponService updateCouponService;
	
	
	@RequestMapping(value = "/list", method= {RequestMethod.GET})
	public ModelAndView CouponPage(CouponVO vo) {
	
		ModelAndView mav = new ModelAndView("sites/coupon/site_coupon_list");
		List<CouponVO> data = selectCouponListService.getCouponList(vo);
		mav.addObject("couponList", data);
		System.out.println("리턴 데이터 : "+ data);
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.GET})
	public ModelAndView CouponEdit(@RequestParam String couponCd) {
		
		ModelAndView mav = new ModelAndView("sites/coupon/site_coupon_edit");
		CouponVO CouponVO = selectCouponService.getCoupon(couponCd);
		
		mav.addObject("couponVO", CouponVO);
		System.out.println("에디또");
		return mav;
	}
	
	@RequestMapping(value = "/edit", method= {RequestMethod.POST})
	public ModelAndView CouponEditAction(CouponVO vo) {
		
		//Service 
		updateCouponService.updateCoupon(vo);
		System.out.println("에띠또 포스트");
		return new ModelAndView("redirect:/sites/coupon/list.mdo");
	}
	
	
	@RequestMapping(value = "/new", method= {RequestMethod.POST})
	public ModelAndView CouponInsertAction(CouponVO vo) {
		
		int result = insertCouponService.insertCoupon(vo);
		ModelAndView mav = new ModelAndView("redirect:/sites/coupon/list.mdo");
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping(value = "/delete", method= {RequestMethod.POST})
	public ModelAndView CouponDeleteAction(@RequestParam String couponCd) {
		deleteCouponService.deleteCoupon(couponCd);
		System.out.println("삭제");
		ModelAndView mav = new ModelAndView("redirect:/sites/coupon/list.mdo");
		return mav;
	}
	
	
	
}
