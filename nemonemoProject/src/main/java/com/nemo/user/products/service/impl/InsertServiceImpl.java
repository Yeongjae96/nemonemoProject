package com.nemo.user.products.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.service.InsertProductsService;
import com.nemo.user.products.vo.ProductsVO;

/**
 * @제목 : 제품 등록 서비스 구현
 * @패키지이름 : com.nemo.user.products.service.impl
 * @파일이름 : InsertServiceImpl.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : 제품 등록 서비스 인터페이스를 구현한 클래스
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
@Service
public class InsertServiceImpl implements InsertProductsService{

	@Autowired
	private ProductsMapper productsDAO;
	
	@Override
	public int insertProducts(ProductsVO vo) {
		return productsDAO.insertProducts(vo);
	}
}
