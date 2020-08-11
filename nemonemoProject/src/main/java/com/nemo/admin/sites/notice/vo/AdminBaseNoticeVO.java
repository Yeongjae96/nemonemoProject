package com.nemo.admin.sites.notice.vo;

import java.sql.Date;

import lombok.Data;

/**
 * @제목 : 공지사항 정보 VO
 * @패키지이름 : com.nemo.admin.sites.vo
 * @파일이름 : NoticeVO.java
 * @작성일 : 2020. 7. 29.
 * @이름 : Hyein
 * @프로그램설명 : Notice 테이블과 매핑되는 공지사항 정보 VO 클래스
 *<pre>
 * == 수정 정보 ==
 * DATE			 AUTHOR			NOTE
 * -------		--------		-------------	
 * 20.07.29 	  이혜인			테이블 명세서에 따른 초기세팅
 * 20.07.30	  김영재			테이블 컬럼 수정에 따른 컬럼명 변경 및 추가(regYmd, modYmd)
 * 20.08.03	  김영재			테이블 컬럼 수정에 따른 컬럼명 변경(RegYmd, EditYmd)
 * 20.08.10	  김영재			테이블 컬럼 추가(delFl)에 따른 변경 및 @Data 추가
 * </pre>
 */

@Data
public class AdminBaseNoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegYmd;
	private Date noticeEditYmd;
	private String noticeDelFl;
	
}