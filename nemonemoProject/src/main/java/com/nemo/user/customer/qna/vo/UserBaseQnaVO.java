package com.nemo.user.customer.qna.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserBaseQnaVO {
	
	//사진 private int qnaImgNo; ??? 
	private int qnaNo;
	private int qnaCategoryNo;
	private int qnaGroup;
	private String qnaRegId;
	private String qnaReplyId;
	private String qnaContent;
	private Date qnaRegDate;
	private Date qnaReplyDate;
	private String qnaReplyFl;
	

}
