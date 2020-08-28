package com.nemo.user.products.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nemo.common.constraints.DirectoryName;
import com.nemo.common.util.ContextUtil;
import com.nemo.common.util.FileUtil;
import com.nemo.user.products.repository.impl.ProductsImageMapper;
import com.nemo.user.products.repository.impl.ProductsMapper;
import com.nemo.user.products.service.InsertProductsService;
import com.nemo.user.products.vo.UserBaseProductsImageVO;
import com.nemo.user.products.vo.UserNewProductsVO;
import com.nemo.user.sign.signup.vo.UserBaseVO;

import lombok.extern.slf4j.Slf4j;

/**
 * @제목 : 제품 등록 서비스 구현
 * @패키지이름 : com.nemo.user.products.service.impl
 * @파일이름 : InsertServiceImpl.java
 * @작성일 : 2020. 7. 27.
 * @이름 : Yeong
 * @프로그램설명 : 제품 등록 서비스 인터페이스를 구현한 클래스 
 *
 */
@Service
@Slf4j
public class InsertProductsServiceImpl implements InsertProductsService {

	@Autowired
	private ProductsMapper productsDAO;
	@Autowired
	private ProductsImageMapper imageMapper;


	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertProducts(UserNewProductsVO vo) {

		// 1. 상품 등록
		
		UserBaseVO user = (UserBaseVO)ContextUtil.getAttrFromSession("user"); 
		
		if(user == null) {
			log.warn("사용자 정보가 담기지 않았습니다.");
			return 0;
		}
		
		int productSeller = user.getUserNo();
		
		vo.setProductSeller(productSeller);
		productsDAO.insertProducts(vo);
		int productNo = vo.getProductNo();
		
		// 2. 상품 이미지 등록
		int imageResult = 0;
		List<MultipartFile> fileList = vo.getProductImages();
		List<UserBaseProductsImageVO> voList = new ArrayList<>();
		try {
			for (MultipartFile file : fileList) {
	
				UserBaseProductsImageVO imageVO = new UserBaseProductsImageVO();
				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
				String extension = FileUtil.getExtension(file.getOriginalFilename());
				String realFileName = FileUtil.getSaveFileNm(orgFileName);
				String dirRealFileName = FileUtil.getSaveFileDirNm(DirectoryName.PRODUCT, realFileName, extension, false);
				// 사진 크기 
				BufferedImage image = ImageIO.read(file.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
				long productImgFileSize = file.getSize();
				
				imageVO.setProductNo(productNo); // 2. productNo
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
			imageResult = imageMapper.insertImage(voList);

		} catch (Exception e) {
			log.warn("{}", e.getMessage());
		} 
		return imageResult;
	}
}
