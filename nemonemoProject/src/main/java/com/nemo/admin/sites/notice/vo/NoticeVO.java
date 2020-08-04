package com.nemo.admin.sites.notice.vo;

import java.sql.Date;

/**
 * @제목 : 공지사항 정보 VO
 * @패키지이름 : com.nemo.admin.sites.vo
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
 * 20.08.03	  김영재			테이블 컬럼 수정에 따른 컬럼명 변경(RegYmd, EditYmd)
 */

public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegYmd;
	private Date noticeEditYmd;
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
	public Date getNoticeRegYmd() {
		return noticeRegYmd;
	}
	public void setNoticeRegYmd(Date noticeRegYmd) {
		this.noticeRegYmd = noticeRegYmd;
	}
	public Date getNoticeEditYmd() {
		return noticeEditYmd;
	}
	public void setNoticeEditYmd(Date noticeEditYmd) {
		this.noticeEditYmd = noticeEditYmd;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeRegYmd=" + noticeRegYmd + ", noticeEditYmd=" + noticeEditYmd + "]";
	}
	
}