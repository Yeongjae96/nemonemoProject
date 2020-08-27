package com.nemo.user.customer.qna.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper =  true)
public class UserNewQnaVO extends UserBaseQnaVO {
	private List<MultipartFile> questionImages;
}
