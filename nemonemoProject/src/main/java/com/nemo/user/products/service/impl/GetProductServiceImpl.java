package com.nemo.user.products.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nemo.common.util.ContextUtil;
import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.repository.impl.UserGetProductMapper;
import com.nemo.user.products.repository.impl.UserProductsCategoryMapper;
import com.nemo.user.products.repository.impl.UserProductsFavoriteMapper;
import com.nemo.user.products.service.GetProductService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsFavoriteVO;
import com.nemo.user.products.vo.UserGetProductVO;
import com.nemo.user.products.vo.UserGetSellerVO;
import com.nemo.user.products.vo.UserSelectedProductVO;
import com.nemo.user.sign.signup.repository.impl.UserMapper;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class GetProductServiceImpl implements GetProductService {
	
	@Autowired
	private UserProductsCategoryMapper categoryMapper;
	@Autowired
	private UserGetProductMapper getProductMapper;
	@Autowired
	private ProductsMapper productsMapper;
	@Autowired
	private UserProductsFavoriteMapper favoriteMapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public UserGetProductVO getProduct(int productNo) {

		UserGetProductVO resultVO = new UserGetProductVO();
		// 1. 선택된 상품정보에 대한 카테고리 및 상품정보 및 해당 상품 이미지
		UserSelectedProductVO selectedProduct = getProductMapper.selectProductFromPdSeq(productNo); // 1. 시퀀스로 타입 검색
		
		resultVO.setSelectedProduct(selectedProduct);
		
		// 2. 전체 카테고리 리스트 || 2. 카테고리 타입에 따른 상품 리스트
		List<UserBaseProductsCategoryVO> list = categoryMapper.getAllCategoryList();

		// 3. 카테고리 타입에 따른 필터링
		UserBaseProductsCategoryVO seqCate = selectedProduct.getProductCateVO();
		Map<String, List<UserBaseProductsCategoryVO>> categoryMap = new HashMap<>();

		List<UserBaseProductsCategoryVO> large = new ArrayList<>();
		List<UserBaseProductsCategoryVO> medium = new ArrayList<>();
		List<UserBaseProductsCategoryVO> small = new ArrayList<>();

		for (UserBaseProductsCategoryVO vo : list) {
			if (vo.getProductCateType().equals("L")) {
				large.add(vo);
			} else if (vo.getProductCateType().equals("M")
					&& vo.getProductCateLarge().equals(seqCate.getProductCateLarge())) {
				medium.add(vo);
			} else if (vo.getProductCateType().equals("S")
					&& vo.getProductCateMedium().equals(seqCate.getProductCateMedium())) {
				small.add(vo);
			}
		}
		categoryMap.put("L", large);
		categoryMap.put("M", medium);
		categoryMap.put("S", small);
		
		resultVO.setCategoryMap(categoryMap);
		
		// 4. 댓글 리스트
		List<Map<String, Object>> commentList = getProductMapper.selectCommentsList(productNo);
		resultVO.setCommentList(commentList);
		
		// 5. 조회수 올리기
		
		// 5-1. 쿠키 검사 
		boolean countUpdateCheck = true;
		Cookie[] cookies = ContextUtil.getRequest().getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("product_seq_" + productNo)) {
					countUpdateCheck = false;
					System.err.println("쿠키생성 감지");
					break;
				}
			}
		}
		
		// 로그인을 안했거나 판매자와 로그인사람이 다르면 보는사람이 다르면 조회수 +1
		if(countUpdateCheck) {
			UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
			if(user == null || selectedProduct.getProductVO().getProductSeller() != user.getUserNo()) {
				// 하루동안 해당 게시물 조회수 늘리지 않도록 쿠키 생성
				Cookie cookie = new Cookie("product_seq_" + productNo, String.valueOf(productNo));
			    cookie.setMaxAge(60*60*24);
			    cookie.setPath("/");
			    ContextUtil.getResponse().addCookie(cookie);
			    countUpdateCheck = true;
			    System.err.println("쿠키생성 완료 ");
			    
				productsMapper.updateView(productNo);
				System.err.println("조회수 올리기 ");
				// 순서로 인하여 조회한 값의 조회수 + 1
				selectedProduct.getProductVO().setProductView(selectedProduct.getProductVO().getProductView()+1); 
			}
		}
		
		// 6. 찜 개수 가져오기
		List<UserBaseProductsFavoriteVO> favoriteList = favoriteMapper.getFavoriteList(productNo);
		resultVO.setFavoriteList(favoriteList);
		
		// 7. 상품 판매에 대한 상점 정보
		UserGetSellerVO productSellerVO = getProductMapper.selectGetSellerVO(selectedProduct.getProductVO().getProductNo());
		resultVO.setProductSellerVO(productSellerVO);
		// 물어보기
		System.err.println(productSellerVO);
		return resultVO;
	}
}
