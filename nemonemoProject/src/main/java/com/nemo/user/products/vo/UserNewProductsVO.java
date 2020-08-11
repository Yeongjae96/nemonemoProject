package com.nemo.user.products.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper =  true)
public class UserNewProductsVO extends UserBaseProductsVO {
	private List<MultipartFile> productImages;

}
