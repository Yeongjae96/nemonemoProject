package com.nemo.admin.sites.banner.repository.impl;

import java.util.List;

import com.nemo.admin.sites.banner.repository.IBannerImageMapper;
import com.nemo.admin.sites.banner.vo.BannerImageVO;
import com.nemo.admin.sites.banner.vo.BannerVO;

public interface BannerImageMapper extends IBannerImageMapper {
	
	public BannerImageVO selectBannerImg(List<BannerVO> list);

}
