package com.nemo.user.products.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nemo.user.products.service.InsertProductsService;
import com.nemo.user.products.vo.UserBaseProductsVO;
import com.nemo.user.products.vo.UserNewProductsVO;

/**
 * @제목 : Products 컨트롤러
 * @패키지이름 : com.nemo.user.products.controller
 * @파일이름 : ProductsController.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : /products url에 해당하는 URL 매핑시키는 컨트롤러
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------	
 * 20.7.27 	김영재				new 경로 설정
 */
@Controller
@RequestMapping("/products")
public class UserNewProductsController{
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private InsertProductsService insertProductsService;
	
	@GetMapping("/new")
	public ModelAndView newPage() {
		ModelAndView mav = new ModelAndView("products/products_new");
		return mav;
	}
	
	@PostMapping("/newJson")
	public @ResponseBody int newAction(UserNewProductsVO vo) {
		logger.info("{} 출력",  vo);
		return insertProductsService.insertProducts(vo);
	}
	

}