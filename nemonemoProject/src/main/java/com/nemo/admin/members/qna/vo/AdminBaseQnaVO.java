package com.nemo.admin.members.qna.vo;

import java.sql.Date;
import lombok.Data;

/**
 * 
 * @제목 : Admin이 베이스가 되는 QNA VO객체
 * @패키지이름 : com.nemo.admin.members.qna.vo
 * @파일이름 : AdminBaseQnaVO.java
 * @작성일 : 2020. 8. 7
 * @이름 : Yerin
 * @프로그램설명 :
 * 
 *
 */
@Data
public class AdminBaseQnaVO {
	
	private int qnaNo;
	private int qnaRegId;
	private	int qnaReplyId;
	private String qnaStoreName;
	private String qnaCategoryNo;
	private String qnaCategoryName;
	private String qnaUserContent;
	private String qnaAdminContent;
	private Date qnaRegYmd;
	private Date qnaReplyYmd;
	private String qnaReplyFl;

}
