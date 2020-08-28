package com.nemo.user.products.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductsCommentsVO {
	private int productCommentNo;
	private int productNo;
	private int productCommentWriter;
	private String productCommentContent;
	private Timestamp productCommentRegDt;
	private String productCommentDelFl;
}
