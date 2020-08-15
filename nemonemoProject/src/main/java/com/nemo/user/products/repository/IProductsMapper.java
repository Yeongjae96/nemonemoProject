package com.nemo.user.products.repository;

import com.nemo.user.products.vo.UserBaseProductsVO;
import com.nemo.user.products.vo.UserNewProductsVO;


/**
 * @제목 :  상품 DAO 인터페이스
 * @패키지이름 : com.nemo.user.products.repository
 * @파일이름 : ProductsDAO.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : 상품 DAO 인터페이스
 *
 */

public interface IProductsMapper {
	public int insertProducts(UserNewProductsVO vo);
	public UserBaseProductsVO selectProduct(int productNo);
}
