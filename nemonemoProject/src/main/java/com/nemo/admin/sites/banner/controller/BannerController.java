package com.nemo.admin.sites.banner.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.banner.service.BannerService;
import com.nemo.admin.sites.banner.vo.AdminBannerVO;
import com.nemo.admin.sites.banner.vo.BannerVO;

/**
 * @제목 : 배너 컨트롤러
 * @패키지이름 : com.nemo.admin.sites.banner.controller
 * @파일이름 : BannerController.java
 * @작성일 : 2020. 8. 13.
 * @이름 : 강성일
 * @프로그램설명 : 배너 컨트롤러
 */

@Controller
@RequestMapping("/sites/banner")
public class BannerController {

	private Logger logger = LoggerFactory.getLogger(getClass()); //이것은 뭐 하는 것인가? //실시간으로 오류 잡을떄 사용?
	
	@Autowired
	private BannerService bannerService;

	// R
	@GetMapping("list")
	public ModelAndView BannerPage(BannerVO vo) {
		ModelAndView mav = new ModelAndView("sites/banner/site_banner_list");
		List<BannerVO> data = bannerService.getBannerList(vo);
		mav.addObject("bannerList", data);
		return mav;

	}

	
	
	
//	// insert
//		@RequestMapping(value = "add", method = { RequestMethod.POST })
//		public ModelAndView BannerAddAction(BannerVO vo) {
//			bannerService.insertBanner(vo);
//			ModelAndView mav = new ModelAndView("redirect:/sites/banner/list.mdo");
//			return mav;
//		}
		
		 /* 배너 등록 등록 */
		   @PostMapping("/newBannerJson")
		   public @ResponseBody int BannerAddAction(AdminBannerVO vo) throws Exception{
			   return bannerService.insertBanner(vo);
		   }
	
		// 1. insertImage라는 메서드는 Mapper에 존재하지 않습니다. 그래서 에러가뜹니다. 테이블에도 들어가지않고,
		// 해결방안) insertImage를 만들어주거나, 만드신 insertBannerImage를 사용하세요 (ServiceImpl)
	

	// D
	// ajax 사용시 ResponseBody가 필요하다.
	@RequestMapping(value = "delete", method = { RequestMethod.POST })

	// @PostMapping("delete") 이거 사용하면 더 간편하게 사용할 수 있다.

	public @ResponseBody int BannerDeleteAction(@RequestParam int bannerNo) {
		return bannerService.deleteBanner(bannerNo);
	}

	// U
	// 수정 하려는 배너 테이블 기본키를 가지고 옴
	@GetMapping("edit")
	public ModelAndView BannerEditPage(@RequestParam int bannerNo) {
		ModelAndView mav = new ModelAndView("sites/banner/site_banner_edit");
		BannerVO bannerVO = bannerService.getBannerNo(bannerNo);
		mav.addObject("bannerVO", bannerVO);
		return mav;

	}

	// update

	// update

	@RequestMapping(value = "edit", method = { RequestMethod.POST })
	public ModelAndView ListEditAction(BannerVO vo) {

		System.out.println("edit POST cont : " + vo);

		bannerService.updateBannerList(vo);

		return new ModelAndView("redirect:/sites/banner/list.mdo");
	}

}
