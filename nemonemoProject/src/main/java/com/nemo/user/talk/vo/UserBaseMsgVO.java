package com.nemo.user.talk.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.annotations.Expose;

import lombok.Data;

/**
 * @제목 : 대화내용 VO
 * @패키지이름 : com.nemo.user.talk.vo
 * @파일이름 : UserBaseMsgVO.java
 * @작성일 : 2020. 9. 5.
 * @이름 : Yeong
 * @프로그램설명 : 대화에 대한 VO
 */

@Data
public class UserBaseMsgVO {
	
	private String msgNo;
	private int talkNo;
	private int msgSender;
	private int msgReceiver;
	private int receiverImgNo;
	private String msgContent;
	private Timestamp msgRegDt;
	private String msgType;
	private String msgConfirmSt;
}
