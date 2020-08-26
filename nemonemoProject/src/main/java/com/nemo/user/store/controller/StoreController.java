package com.nemo.user.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.admin.sites.notice.vo.AdminBaseNoticeVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.store.service.DeleteStoreCommentService;
import com.nemo.user.store.service.GetStoreCommentListService;
import com.nemo.user.store.service.GetStoreFavoriteListService;
import com.nemo.user.store.service.GetStoreProductListService;
import com.nemo.user.store.service.GetStoreReviewListService;
import com.nemo.user.store.service.GetStoreService;
import com.nemo.user.store.service.InsertStoreCommentService;
import com.nemo.user.store.service.UpdateStoreService;
import com.nemo.user.store.vo.StoreCommentVO;
import com.nemo.user.store.vo.StoreFavoriteVO;
import com.nemo.user.store.vo.StoreProductVO;
import com.nemo.user.store.vo.StoreReviewVO;
import com.nemo.user.store.vo.StoreVO;


/**
 * @제목 : 상점 관리 컨트롤러
 * @패키지이름 : com.nemo.user.store.controller
 * @파일이름 :StoreController.java
 * @작성일 : Aug 14, 2020
 * @이름 : Hyein
 * @프로그램설명 : 회원별 상점의 메뉴 경로를 지정하는 컨트롤러
 */

@Controller
@RequestMapping("/shop/{storeNo}")
public class StoreController {
	
	@Autowired private GetStoreService getStoreService;
	@Autowired private GetStoreProductListService getStoreProductListService;
	@Autowired private UpdateStoreService updateStoreService;
	@Autowired private GetStoreCommentListService getStoreCommentListService;
	@Autowired private InsertStoreCommentService insertStoreCommentService;
	@Autowired private GetStoreReviewListService getStoreReviewListService;
	@Autowired private GetStoreFavoriteListService getStoreFavoriteListService;
	@Autowired private DeleteStoreCommentService deleteStoreCommentService;
	
	@GetMapping("/products")
	public ModelAndView GetStoreInfoProducts(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/products/products");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		List<StoreProductVO> storeProductVO = getStoreProductListService.getStoreProductList(storeNo);
		List<StoreCommentVO> storeCommentVO = getStoreCommentListService.getStoreCommentList(storeNo);
		List<StoreReviewVO> storeReviewVO = getStoreReviewListService.getStoreReviewList(storeNo);
		List<StoreFavoriteVO> storeFavoriteVO = getStoreFavoriteListService.getStoreFavoriteList(storeNo);
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeProductVO", storeProductVO);
		mav.addObject("storeCommentVO", storeCommentVO);
		mav.addObject("storeReviewVO", storeReviewVO);
		mav.addObject("storeFavoriteVO", storeFavoriteVO);
		
		return mav;
	}

	@RequestMapping(value = "/info", method= {RequestMethod.GET})
	public ModelAndView StoreInfoEdit(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/storeinfo");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		mav.addObject("storeVO", storeVO);
		
		return mav;
	}
	
	@PostMapping("/updateStore")
	public ModelAndView UpdateStoreAction(StoreVO vo) {
		 updateStoreService.updateStore(vo);
		 return new ModelAndView("redirect:/shop/{storeNo}/products.do");
	}
	
	@GetMapping("/comments")
	public ModelAndView GetStoreCommentsList(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/comments/comments");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		List<StoreProductVO> storeProductVO = getStoreProductListService.getStoreProductList(storeNo);
		List<StoreCommentVO> storeCommentVO = getStoreCommentListService.getStoreCommentList(storeNo);
		List<StoreReviewVO> storeReviewVO = getStoreReviewListService.getStoreReviewList(storeNo);
		List<StoreFavoriteVO> storeFavoriteVO = getStoreFavoriteListService.getStoreFavoriteList(storeNo);
		
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeProductVO", storeProductVO);
		mav.addObject("storeCommentVO", storeCommentVO);
		mav.addObject("storeReviewVO", storeReviewVO);
		mav.addObject("storeFavoriteVO", storeFavoriteVO);
		
		return mav;
	}
	
	@PostMapping("/newComment")
	public ModelAndView storeCommentInsertAction(StoreCommentVO vo, @RequestParam(value="storeCommentWriter") int storeNo) {
		insertStoreCommentService.insertStoreComment(vo);
		
		ModelAndView mav = new ModelAndView("redirect:/shop/{storeNo}/comments.do");
		return mav;
	}
	
	@PostMapping("/delComment")
	public ModelAndView storeCommentDeleteAction(@RequestParam int storeCommentNo) {
		deleteStoreCommentService.deleteStoreComment(storeCommentNo);
		
		ModelAndView mav = new ModelAndView("redirect:/shop/{storeNo}/comments.do");
		return mav;
	}
	
	
	@GetMapping("/reviews")
	public ModelAndView GetStoreReviewsList(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/reviews/reviews");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		List<StoreProductVO> storeProductVO = getStoreProductListService.getStoreProductList(storeNo);
		List<StoreCommentVO> storeCommentVO = getStoreCommentListService.getStoreCommentList(storeNo);
		List<StoreReviewVO> storeReviewVO = getStoreReviewListService.getStoreReviewList(storeNo);
		List<StoreFavoriteVO> storeFavoriteVO = getStoreFavoriteListService.getStoreFavoriteList(storeNo);
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeProductVO", storeProductVO);
		mav.addObject("storeCommentVO", storeCommentVO);
		mav.addObject("storeReviewVO", storeReviewVO);
		mav.addObject("storeFavoriteVO", storeFavoriteVO);
		
		return mav;
	}
	
	@GetMapping("/favorites")
	public ModelAndView GetStoreFavoritesList(@PathVariable int storeNo) {
		ModelAndView mav = new ModelAndView("store/favorites/favorites");

		StoreVO storeVO = getStoreService.getStore(storeNo);
		List<StoreProductVO> storeProductVO = getStoreProductListService.getStoreProductList(storeNo);
		List<StoreCommentVO> storeCommentVO = getStoreCommentListService.getStoreCommentList(storeNo);
		List<StoreReviewVO> storeReviewVO = getStoreReviewListService.getStoreReviewList(storeNo);
		List<StoreFavoriteVO> storeFavoriteVO = getStoreFavoriteListService.getStoreFavoriteList(storeNo);
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeProductVO", storeProductVO);
		mav.addObject("storeCommentVO", storeCommentVO);
		mav.addObject("storeReviewVO", storeReviewVO);
		mav.addObject("storeFavoriteVO", storeFavoriteVO);
		
		return mav;
	}
}