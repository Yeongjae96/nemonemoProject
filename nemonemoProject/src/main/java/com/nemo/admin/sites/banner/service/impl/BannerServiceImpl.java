package com.nemo.admin.sites.banner.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nemo.admin.sites.banner.repository.impl.BannerImageMapper;
import com.nemo.admin.sites.banner.repository.impl.BannerMapper;
import com.nemo.admin.sites.banner.service.BannerService;
import com.nemo.admin.sites.banner.vo.AdminBannerVO;
import com.nemo.admin.sites.banner.vo.BannerImageVO;
import com.nemo.admin.sites.banner.vo.BannerVO;
import com.nemo.common.constraints.DirectoryName;
import com.nemo.common.util.FileUtil;

/**
 * @제목 : 배너 서비스 impl
 * @패키지이름 : com.nemo.admin.sites.banner.service.impl
 * @파일이름 : BannerServiceImpl.java
 * @작성일 : 2020. 8. 13.
 * @이름 : 강성일
 * @프로그램설명 :배너 서비스 impl
 */

@Service
public class BannerServiceImpl implements BannerService {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private BannerMapper BannerDAO;

	@Autowired
	private BannerImageMapper imageMapper;

	@Override
	// 데이터 베이스에 저장되어 있는 배너 정보를 배너 list로 가져옴
	public List<BannerVO> getBannerList(BannerVO vo) {

		return BannerDAO.getBannerList(vo);

	}

	@Override
	// 데이터 베이스 베너 삭제
	public int deleteBanner(int bannerNo) {

		return BannerDAO.deleteBanner(bannerNo);
	}

	// 배너 업데이트
	@Override
	public int updateBannerList(BannerVO vo) {

		return BannerDAO.updateBannerList(vo);
	}

	// 배너 업데이트를 위한 컬럼 기본키 가져오는것
	@Override
	public BannerVO getBannerNo(int bannerNO) {

		return BannerDAO.getBannerNo(bannerNO);
	}

	// 배너와 이미지 insert!!
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertBanner(AdminBannerVO vo) {

		// 배너 등록
		BannerDAO.insertBanner(vo);
		
		int bannerNo = vo.getBannerNo();

		// 2. QNA 이미지 등록
		int imageResult = 0;
		List<MultipartFile> fileList = vo.getBannerImages();
		List<BannerImageVO> voList = new ArrayList<>();

		try {
			for (MultipartFile file : fileList) {
				BannerImageVO imageVO = new BannerImageVO();
				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
				String extension = FileUtil.getExtension(file.getOriginalFilename());
				String realFileName = FileUtil.getSaveFileNm(orgFileName);
				String dirRealFileName = FileUtil.getSaveFileDirNm(DirectoryName.BANNER, orgFileName, extension, true);
				
				
				// 사진 크기
				BufferedImage image = ImageIO.read(file.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();

				long bannerImgFileSize = file.getSize();

				imageVO.setBannerNo(bannerNo);
				imageVO.setBannerImgOriginName(orgFileName);// 사용자 파일 저장 이름
				imageVO.setBannerImgFileName(realFileName); // 실제 파일 저장 이름
				imageVO.setBannerImgFileSize(bannerImgFileSize);
				imageVO.setBannerImgWidth(width);
				imageVO.setBannerImgHeight(height);
				imageVO.setBannerImgType(extension.toUpperCase()); // 확장자 이름

				File dirFileName = new File(dirRealFileName);
				FileUtil.exsitDir(dirFileName);
				voList.add(imageVO);

				/*
				 * logger.info("================================");
				 * logger.info("OriginalFileName : {} ", file.getOriginalFilename());
				 * logger.info("FileSize :  {} ", file.getSize());
				 * logger.info("extension : {} ", extension);
				 * logger.info("dirRealFileName : {} ", dirRealFileName);
				 * logger.info("================================");
				 */

				file.transferTo(dirFileName);

			}

			imageResult = imageMapper.insertImage(voList);
		} catch (Exception e) {
			logger.warn("{}", e.getMessage());
		}
		return imageResult;
	}

}
