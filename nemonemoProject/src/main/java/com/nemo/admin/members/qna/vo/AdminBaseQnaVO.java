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
 * @프로그램설명 : Admin 페이지에 Qna 테이블 row값
 * 
 *
 */

@Data
public class AdminBaseQnaVO {
	private int qnaNo;
	private String qnaStore;
	private String qnaCateNo;
	private String qnaTitle;
	private Date qnaRegYmd;
	private String qnaReplyFlag;

}
