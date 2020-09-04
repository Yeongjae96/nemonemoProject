package com.nemo.common.image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.sites.banner.repository.impl.BannerImageMapper;
import com.nemo.admin.sites.banner.vo.BannerImageVO;
import com.nemo.common.image.service.BannerFileService;

@Service
public class BannerFileServiceImpl implements BannerFileService {

	@Autowired
	private BannerImageMapper bannerImageMapper;

	@Override
	public BannerImageVO getFile(int bannerImgNo) {
		BannerImageVO imageVO = bannerImageMapper.selectBannerImage(bannerImgNo);
		return imageVO;
	}
}
