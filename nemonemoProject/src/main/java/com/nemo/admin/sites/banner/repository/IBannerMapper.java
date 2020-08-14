package com.nemo.admin.sites.banner.repository;

import java.util.List;


import com.nemo.admin.sites.banner.vo.BannerVO;

/**
 * @제목 : 배너 맵퍼
 * @패키지이름 : com.nemo.admin.sites.banner.repository
 * @파일이름 : IBannerMapper.java
 * @작성일 : 2020. 8. 13.
 * @이름 : 강성일
 * @프로그램설명 : 배너 맵퍼
 */

public interface IBannerMapper {

	//데이터 추출
	public List<BannerVO> getBannerList(BannerVO vo);

	//데이터 삭제
	public int deleteBanner(int bannerNo);

	//데이터 수정
	public int updateBannerList(BannerVO vo);

	//업데이트에 필요한 데이터를 가져오기 위함
	public BannerVO getBannerNo(int bannerNO);
	
	
	

}
