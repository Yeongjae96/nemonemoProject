package com.nemo.user.customer.vo;

import java.sql.Date;

/**
 * @제목 : 공지사항 정보 VO
 * @패키지이름 : com.nemo.user.customer.vo
 * @파일이름 : NoticeVO.java
 * @작성일 : 2020. 7. 29.
 * @이름 : Hyein
 * @프로그램설명 : Notice 테이블과 매핑되는 공지사항 정보 VO 클래스
 * == 수정 정보 ==
 *
 * DATE			 AUTHOR			NOTE
 * -------		--------		-------------	
 * 20.07.29 	  이혜인			테이블 명세서에 따른 초기세팅
 * 20.07.30	  김영재			테이블 컬럼 수정에 따른 컬럼명 변경 및 추가(regYmd, modYmd)
 * 20.07.30	  김영재			쿼리문 수정에 의한 원상복구 (noticeYmd)
 * 
 */

public class UserNoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeYmd;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeYmd() {
		return noticeYmd;
	}
	public void setNoticeYmd(Date noticeYmd) {
		this.noticeYmd = noticeYmd;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeYmd=" + noticeYmd + "]";
	}
	
	
}