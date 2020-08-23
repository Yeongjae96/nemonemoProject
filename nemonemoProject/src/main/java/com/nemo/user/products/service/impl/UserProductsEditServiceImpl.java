package com.nemo.user.products.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nemo.common.constrants.DirectoryName;
import com.nemo.common.util.ContextUtil;
import com.nemo.common.util.FileUtil;
import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.repository.impl.UserProductsEditMapper;
import com.nemo.user.products.service.UserProductsEditService;
import com.nemo.user.products.vo.UserBaseProductsCategoryVO;
import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserNewProductsVO;
import com.nemo.user.products.vo.UserProductsEditVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class UserProductsEditServiceImpl implements UserProductsEditService{
	
	@Autowired
	private UserProductsEditMapper userProductsEditMapper;
	@Autowired
	private ProductsImageMapper productImageMapper;
	
	
	@Override
	public UserProductsEditVO getEditVO(int productNo) {
		
		// 로그인을 하지 않아도  null, 요청자와 판매자가 달라도 null
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user");
		if(user == null) return null;
		
		UserProductsEditVO vo = userProductsEditMapper.getProductEditVO(productNo);
		
		if(vo.getProductVO().getProductSeller() != user.getUserNo()) return null; 
		
		UserBaseProductsCategoryVO selectedCate = vo.getProductCateVO();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("productCateNo", selectedCate.getProductCateNo());
		paramMap.put("productCateType", selectedCate.getProductCateType());
		
		//뿌려줄 카테고리 리스트
		List<UserBaseProductsCategoryVO> cateList = userProductsEditMapper.getProductCateList(paramMap);
		
		List<UserBaseProductsCategoryVO> large = new ArrayList<>();
		List<UserBaseProductsCategoryVO> medium = new ArrayList<>();
		List<UserBaseProductsCategoryVO> small = new ArrayList<>();
		
		for(UserBaseProductsCategoryVO temp : cateList) {
			String tempCate = temp.getProductCateType();
			if(tempCate.equals("L")) {
				large.add(temp);
			} else if(tempCate.equals("M")) {
				medium.add(temp);
			} else {
				small.add(temp);
			}
		}
		
		Map<String, List<UserBaseProductsCategoryVO>> cateMap = new HashMap<>();
		cateMap.put("large", large);
		cateMap.put("medium", medium);
		cateMap.put("small", small);
		
		vo.setCateMap(cateMap);
		
		return vo;
	}
	
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int editProduct(UserNewProductsVO vo) {
		
		// 기존의 파일들 DB상에서 제거 처리
		productImageMapper.deleteProductImages(vo.getProductCateNo());
		
		// 첨부파일이 수정되었는지에 대한 체크
		List<MultipartFile> images = vo.getProductImages();
		
		int imageResult = 0;
		List<UserBaseProductsImageVO> voList = new ArrayList<>();
		InputStream inputStream = null;
		
		try {
			for(MultipartFile file : images) {
				UserBaseProductsImageVO imageVO = new UserBaseProductsImageVO();
				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
				String extension = FileUtil.getExtension(file.getOriginalFilename());
				String realFileName = FileUtil.getSaveFileNm(orgFileName);
				String dirRealFileName = FileUtil.getSaveFileDirNm(DirectoryName.PRODUCT, realFileName, extension, false);
				// 사진 크기 
				
				inputStream = file.getInputStream();
				
				BufferedImage image = ImageIO.read(inputStream);
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
				long productImgFileSize = file.getSize();
				
				imageVO.setProductNo(vo.getProductNo()); // 2. productNo
				imageVO.setProductImgOriginName(orgFileName); // 3. 사용자 파일 저장 이름
				imageVO.setProductImgFileName(realFileName); // 4. 실제 파일 저장 이름
				imageVO.setProductImgFileSize(productImgFileSize); // 5. 파일 크기
				imageVO.setProductImgWidth(width); // 6. 가로 크기
				imageVO.setProductImgHeight(height); // 7. 세로 크기
				imageVO.setProductImgType(extension.toUpperCase()); // 8. 확장자 이름
				
				File dirFileName = new File(dirRealFileName);
				FileUtil.exsitDir(dirFileName);
				voList.add(imageVO);
				
				file.transferTo(dirFileName);
			}
			imageResult = productImageMapper.insertImage(voList);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(inputStream != null) try { inputStream.close(); } catch(Exception e) {}
		}
		
		return imageResult;
	}
}
