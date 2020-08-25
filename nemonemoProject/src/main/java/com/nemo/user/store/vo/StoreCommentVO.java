package com.nemo.user.store.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper =  true)
public class StoreCommentVO{
	private int storeCommentNo;
	private int storeNo;
	private String storeName;
	private int storeCommentWriter;
	private String storeCommentContent;
	private Date storeCommentRegDt;
}
