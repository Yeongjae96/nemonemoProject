package com.nemo.user.customer.qna.vo;

import java.sql.Date;

import lombok.Data;

/**
 * 
 * @제목 : User가 베이스가 되는 QNA VO객체
 * @패키지이름 : com.nemo.user.customer.qna.vo
 * @파일이름 : AdminBaseQnaVO.java
 * @작성일 : 2020. 8. 10
 * @이름 : Yerin
 * @프로그램설명 :
 * 
 *
 */


@Data
public class UserBaseQnaVO {
	
	private int qnaNo;
	private int qnaCategoryNo;
	private int qnaRegId;
	private String qnaReplyId;
	private String qnaUserContent;
	private String qnaAdminContent;
	private String qnaCategoryName;
	private Date qnaRegYmd;
	private Date qnaReplyYmd;
	private String qnaReplyFl;

}
