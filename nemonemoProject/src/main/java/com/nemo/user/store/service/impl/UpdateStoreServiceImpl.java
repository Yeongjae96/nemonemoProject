package com.nemo.user.store.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nemo.common.constraints.DirectoryName;
import com.nemo.common.util.FileUtil;
import com.nemo.user.store.repository.impl.StoreMapper;
import com.nemo.user.store.service.UpdateStoreService;
import com.nemo.user.store.vo.StoreImageVO;
import com.nemo.user.store.vo.UserNewStoreVO;

@Service
public class UpdateStoreServiceImpl implements UpdateStoreService{

	@Autowired
	private StoreMapper storeDAO;
	
	@Autowired
	private StoreMapper imageMapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateStore(UserNewStoreVO vo) {

		// 1. 상점 수정
		storeDAO.updateStore(vo);
		int StoreNo = vo.getStoreNo();
		
		// 2. 상점 이미지 등록
		int imageResult = 0;
		MultipartFile file = vo.getStoreImage();
		//List<MultipartFile> fileList = vo.getStoreImages();
		//List<UserBaseStoresImageVO> voList = new ArrayList<>();
		try {
			//for (MultipartFile file : fileList) {
	
				StoreImageVO imageVO = new StoreImageVO();
				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
				String extension = FileUtil.getExtension(file.getOriginalFilename());
				String realFileName = FileUtil.getSaveFileNm(orgFileName);
				String dirRealFileName = FileUtil.getSaveFileDirNm(DirectoryName.STORE, orgFileName, extension, false);
				// 사진 크기 
				BufferedImage image = ImageIO.read(file.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
				long StoreImgFileSize = file.getSize();
				
				imageVO.setStoreNo(StoreNo); // 2. StoreNo
				imageVO.setStoreImgOriginName(orgFileName); // 3. 사용자 파일 저장 이름
				imageVO.setStoreImgFileName(realFileName); // 4. 실제 파일 저장 이름
				imageVO.setStoreImgFileSize(StoreImgFileSize); // 5. 파일 크기
				imageVO.setStoreImgWidth(width); // 6. 가로 크기
				imageVO.setStoreImgHeight(height); // 7. 세로 크기
				imageVO.setStoreImgType(extension.toUpperCase()); // 8. 확장자 이름
				
				File dirFileName = new File(dirRealFileName);
				FileUtil.exsitDir(dirFileName);
				//voList.add(imageVO);
				
//				logger.info("================================");
//				logger.info("OriginalFileName : {} ", file.getOriginalFilename());
//				logger.info("FileSize :  {} ", file.getSize());
//				logger.info("extension : {} ", extension);
//				logger.info("dirRealFileName : {} ", dirRealFileName);
//				logger.info("================================");
				
				file.transferTo(dirFileName);
			//}
			imageResult = imageMapper.updateStore(vo);

		} catch (Exception e) {
//			logger.warn("{}", e.getMessage());

		} 
		return imageResult;

	}
}
