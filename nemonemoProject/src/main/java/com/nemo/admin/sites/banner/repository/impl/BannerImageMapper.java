package com.nemo.admin.sites.banner.repository.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.sites.banner.repository.IBannerImageMapper;
import com.nemo.admin.sites.banner.vo.BannerImageVO;
import com.nemo.admin.sites.banner.vo.BannerVO;



@Mapper
public interface BannerImageMapper extends IBannerImageMapper {
	
	public BannerImageVO selectBannerImg(List<BannerVO> list);
	public int insertImage(List<BannerImageVO> voList);
	public BannerImageVO selectImage(int bannerImgNo);

}
