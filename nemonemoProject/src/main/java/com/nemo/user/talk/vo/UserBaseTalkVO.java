package com.nemo.user.talk.vo;

import lombok.Data;

/**
 * @제목 : 대화방 VO
 * @패키지이름 : com.nemo.user.talk.vo
 * @파일이름 : UserBaseTalkVO.java
 * @작성일 : 2020. 9. 5.
 * @이름 : Yeong
 * @프로그램설명 : 대화방을 나타내는 VO객체이다.
 */
@Data
public class UserBaseTalkVO {
	private int talkNo;
	private int lowUserNo;
	private int highUserNo;
	private String talkSt;
}
