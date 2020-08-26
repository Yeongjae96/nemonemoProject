//package com.nemo.user.store.service.impl;
//
//import java.awt.image.BufferedImage;
//import java.io.File;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.imageio.ImageIO;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.nemo.common.util.FileUtil;
//import com.nemo.user.products.repository.impl.ProductsImageMapper;
//import com.nemo.user.products.repository.impl.ProductsMapper;
//import com.nemo.user.products.vo.UserBaseProductsImageVO;
//import com.nemo.user.products.vo.UserNewProductsVO;
//import com.nemo.user.store.repository.IStoreImageMapper;
//import com.nemo.user.store.repository.impl.StoreMapper;
//import com.nemo.user.store.service.UpdateStoreService;
//import com.nemo.user.store.vo.StoreVO;
//
//@Service
//public class UpdateStoreServiceImpl implements UpdateStoreService{
//
//	private Logger logger = LoggerFactory.getLogger(getClass());
//
//	@Autowired
//	private StoreMapper storeDAO;
//	@Autowired
//	private IStoreImageMapper imageMapper;
//
//	private static final String SAVE_PATH = "/upload";
//	private static final String PREFIX_URL = "/upload/";
//
//	@Override
//	@Transactional(rollbackFor = Exception.class)
//	public int updateStore(StoreVO vo) {
//
//		// 1. 상품 등록
//		storeDAO.updateStore(vo);
//		int storeNo = vo.getStoreNo();
//		
//		// 2. 상품 이미지 등록
//		int imageResult = 0;
//		int file = vo.getStoreImgNo();
//		//List<MultipartFile> fileList = vo.getStoreImgNo();
//		//List<UserBaseProductsImageVO> voList = new ArrayList<>();
//		try {
//			for (MultipartFile file : fileList) {
//	
//				UserBaseProductsImageVO imageVO = new UserBaseProductsImageVO();
//				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
//				String extension = FileUtil.getExtension(file.getOriginalFilename());
//				String realFileName = FileUtil.getSaveFileNm(orgFileName);
//				String dirRealFileName = FileUtil.getSaveFileDirNm(PREFIX_URL, orgFileName, extension);
//				// 사진 크기 
//				BufferedImage image = ImageIO.read(file.getInputStream());
//				Integer width = image.getWidth();
//				Integer height = image.getHeight();
//				
//				long productImgFileSize = file.getSize();
//				
//				imageVO.setProductNo(storeNo); // 2. storeNo
//				imageVO.setProductImgOriginName(orgFileName); // 3. 사용자 파일 저장 이름
//				imageVO.setProductImgFileName(realFileName); // 4. 실제 파일 저장 이름
//				imageVO.setProductImgFileSize(productImgFileSize); // 5. 파일 크기
//				imageVO.setProductImgWidth(width); // 6. 가로 크기
//				imageVO.setProductImgHeight(height); // 7. 세로 크기
//				imageVO.setProductImgType(extension.toUpperCase()); // 8. 확장자 이름
//				
//				File dirFileName = new File(dirRealFileName);
//				FileUtil.exsitDir(dirFileName);
//				voList.add(imageVO);
//				
//				logger.info("================================");
//				logger.info("OriginalFileName : {} ", file.getOriginalFilename());
//				logger.info("FileSize :  {} ", file.getSize());
//				logger.info("extension : {} ", extension);
//				logger.info("dirRealFileName : {} ", dirRealFileName);
//				logger.info("================================");
//				
//				file.transferTo(dirFileName);
//			}
//			imageResult = imageMapper.insertImage(voList);
//
//		} catch (Exception e) {
//			logger.warn("{}", e.getMessage());
//		} 
//		return imageResult;
//	}
//}

package com.nemo.user.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.UpdateStoreService;
import com.nemo.user.store.vo.StoreVO;

@Service
public class UpdateStoreServiceImpl implements UpdateStoreService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Override
	public int updateStore(StoreVO vo) {
		return storeDAO.updateStore(vo);
	}
}
