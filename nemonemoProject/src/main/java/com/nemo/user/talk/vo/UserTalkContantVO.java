package com.nemo.user.talk.vo;

import lombok.Data;

/**
 * @제목 : 연락하기 VO 객체
 * @패키지이름 : com.nemo.user.talk.vo
 * @파일이름 : UserTalkContantVO.java
 * @작성일 : 2020. 9. 2.
 * @이름 : Yeong
 * @프로그램설명 : 연락하기로 Talk을 켰을때 띄워주는 정보
 */
@Data
public class UserTalkContantVO {
	private int productImgNo;
	private int productNo;
	private String productName;
	private int productPrice;
	private int productSeller;
}
