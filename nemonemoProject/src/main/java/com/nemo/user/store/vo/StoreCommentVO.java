package com.nemo.user.store.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreCommentVO{
	private int storeCommentNo;
	private int storeNo;
	private String storeName;
	private int storeCommentWriter;
	private String storeCommentContent;
	private Date storeCommentRegDt;
}
