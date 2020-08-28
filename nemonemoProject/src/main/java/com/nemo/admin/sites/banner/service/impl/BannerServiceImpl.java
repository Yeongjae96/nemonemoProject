package com.nemo.admin.sites.banner.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.members.report.category.vo.ReportCategoryVO;
import com.nemo.admin.sites.banner.repository.impl.BannerMapper;
import com.nemo.admin.sites.banner.service.BannerService;
import com.nemo.admin.sites.banner.vo.BannerVO;


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

	@Autowired
	private BannerMapper BannerDAO;

	@Override
	//데이터 베이스에 저장되어 있는 배너 정보를 배너 list로 가져옴 
	public List<BannerVO> getBannerList(BannerVO vo) {

		return BannerDAO.getBannerList(vo);

	}

	
	@Override
	//데이터 베이스 베너  삭제
	public int deleteBanner(int bannerNo) {
		
		return BannerDAO.deleteBanner(bannerNo);
	}

	
	//배너 업데이트
	@Override
	public int updateBannerList(BannerVO vo) {
		
		return BannerDAO.updateBannerList(vo);
	}

	//배너 업데이트를 위한 컬럼 기본키 가져오는것
	@Override
	public BannerVO getBannerNo(int bannerNO) {
		
		return BannerDAO.getBannerNo(bannerNO);
	}


	@Override
	public int insertBanner(BannerVO vo) {
		
		return BannerDAO.insertBanner(vo);
	}
	
	
	
	

}
