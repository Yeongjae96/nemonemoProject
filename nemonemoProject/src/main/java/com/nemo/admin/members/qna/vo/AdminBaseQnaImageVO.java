package com.nemo.admin.members.qna.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class AdminBaseQnaImageVO {
	
	private int qnaImgNo;
	private int qnaNo;
	private String qnaImgOriginName;
	private String qnaImgFileName;
	private long qnaImgFileSize;
	private int qnaImgWidth;
	private int qnaImgHeight;
	private String qnaImgType;
	private Date qnaImgDt;
	
}
