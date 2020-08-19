package com.nemo.user.customer.qna.service.impl;

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

import com.nemo.common.constrants.DirectoryName;
import com.nemo.common.util.FileUtil;
import com.nemo.user.customer.qna.repository.impl.CustomerQnaMapper;
import com.nemo.user.customer.qna.repository.impl.QnaImageMapper;
import com.nemo.user.customer.qna.service.InsertQnaService;
import com.nemo.user.customer.qna.vo.UserBaseQnaImageVO;
import com.nemo.user.customer.qna.vo.UserNewQnaVO;

import lombok.extern.slf4j.Slf4j;



/**
 * @제목 : QNA 등록 서비스 구현
 * @패키지이름 : com.nemo.user.customer.qna.service.impl
 * @파일이름 : InsertQnaServiceImpl.java
 * @작성일 : 2020. 8. 14.
 * @이름 : Yerin
 * @프로그램설명 : QNA 서비스 인터페이스를 구현한 클래스 
 *
 */

@Service
@Slf4j
public class InsertQnaServiceImpl implements InsertQnaService{
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CustomerQnaMapper customerQnaMapper;
	@Autowired
	private QnaImageMapper imageMapper;
	

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertQna(UserNewQnaVO vo) {
		System.err.println("11"+vo);
		// 1. QNA 등록
		customerQnaMapper.insertQna(vo);
		
		System.out.println("InsertService: qna 등록");
		int qnaNo = vo.getQnaNo();
		
		// 2. QNA 이미지 등록
		int imageResult = 0;
		List<MultipartFile> fileList = vo.getQuestionImages();
		List<UserBaseQnaImageVO> voList = new ArrayList<>();
																									System.out.println(fileList);
																									System.out.println(voList);
		try {
			System.out.println("insertqnaservice : try문 들어감..");
			for(MultipartFile file : fileList) {
				System.out.println("insertqnaservice : for문 들어감..");
				UserBaseQnaImageVO imageVO = new UserBaseQnaImageVO();
				String orgFileName = FileUtil.getOrgFileName(file.getOriginalFilename());
				String extension = FileUtil.getExtension(file.getOriginalFilename());
				String realFileName = FileUtil.getSaveFileNm(orgFileName);
				String dirRealFileName = FileUtil.getSaveFileDirNm(DirectoryName.QNA, orgFileName, extension);
				// 사진 크기
				BufferedImage image = ImageIO.read(file.getInputStream());
				Integer width = image.getWidth();
				Integer height = image.getHeight();
				
				long qnaImgFileSize = file.getSize();
				
				imageVO.setQnaNo(qnaNo); 
				imageVO.setQnaImgOriginName(orgFileName); // 사용자 파일 저장 이름
				imageVO.setQnaImgFileName(realFileName); // 실제 파일 저장 이름
				imageVO.setQnaImgFileSize(qnaImgFileSize);
				imageVO.setQnaImgWidth(width);
				imageVO.setQnaImgHeight(height);
				imageVO.setQnaImgType(extension.toUpperCase()); // 확장자 이름
				
				File dirFileName = new File(dirRealFileName);
				FileUtil.exsitDir(dirFileName);
				voList.add(imageVO);
				
				logger.info("================================");
				logger.info("OriginalFileName : {} ", file.getOriginalFilename());
				logger.info("FileSize :  {} ", file.getSize());
				logger.info("extension : {} ", extension);
				logger.info("dirRealFileName : {} ", dirRealFileName);
				logger.info("================================");
				
				file.transferTo(dirFileName);				
				
			}
			
			imageResult = imageMapper.insertImage(voList);
		}catch(Exception e) {
			logger.warn("{}", e.getMessage());
		}
		return imageResult;
	}
}
