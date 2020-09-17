package com.nemo.user.products.service;

import com.nemo.user.products.vo.UserNewProductsVO;


/**
 * @제목 : 제품 등록 서비스
 * @패키지이름 : com.nemo.user.products.service
 * @파일이름 : InsertProductsService.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : 제품 등록 서비스 인터페이스
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public interface InsertProductsService {
	public int insertProducts(UserNewProductsVO vo) throws Exception;
}
