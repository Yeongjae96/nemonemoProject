package com.nemo.admin.sites.banner.repository;

import com.nemo.admin.sites.banner.vo.BannerImageVO;


public interface IBannerImageMapper {
	
	public int insertImage(BannerImageVO vo);
	public BannerImageVO selectBannerImage(int bannerImgNo);

}
