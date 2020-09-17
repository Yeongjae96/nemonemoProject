package com.nemo.admin.sites.banner.service;

import java.util.List;

import com.nemo.admin.sites.banner.vo.AdminBannerVO;
import com.nemo.admin.sites.banner.vo.BannerVO;

/**
 * @제목 : 배너 서비스
 * @패키지이름 : com.nemo.admin.sites.banner.service
 * @파일이름 : BannerService.java
 * @작성일 : 2020. 8. 13.
 * @이름 : 강성일
 * @프로그램설명 : 배너 서비스
 */

public interface BannerService {

	// 데이터 베이스 데이터 추출
	public List<BannerVO> getBannerList(BannerVO vo);

	// 데이터 삭제
	public int deleteBanner(int bannerNo);

	// 데이터 수정
	public int updateBannerList(BannerVO vo);

	// 업데이트에 필요한 데이터를 가져오기 위함
	public BannerVO getBannerNo(int bannerNO);
	
	//데이터 삽입
	public int insertBanner(AdminBannerVO vo) throws Exception; 
	


}
