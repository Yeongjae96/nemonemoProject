package com.nemo.user.store.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class UserNewStoreVO extends StoreVO{
	private MultipartFile storeImage;
}
