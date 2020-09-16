package com.nemo.admin.sites.banner.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper =  true)
public class AdminBannerVO extends BannerVO {
	private List<MultipartFile> bannerImages;
	

}
