package com.nemo.user.products.repository.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.user.products.repository.ProductsDAO;
import com.nemo.user.products.vo.ProductsVO;

/**
 * @제목 : 상품 DAO 마이바티스
 * @패키지이름 : com.nemo.user.products.repository.impl
 * @파일이름 : ProductsDAOMybatis.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : ProductsDAO를 구현한 마이바티스 Repository 객체이다.
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
@Repository
public class ProductsDAOMybatis implements ProductsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProducts(ProductsVO vo) {
		return sqlSession.insert("Products.insert", vo);
	}
}
