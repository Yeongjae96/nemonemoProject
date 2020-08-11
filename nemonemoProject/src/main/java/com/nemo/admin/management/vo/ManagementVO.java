
/**
 * @제목 : 어드민 정보 VO

 * @패키지이름 : com.nemo.user.management.vo
 * @파일이름 : ManagementVO.java
 * @작성일 : 2020. 7. 29.
 * @이름 : Yerin / Seoungil
 * @프로그램설명 : ADMIN_ACCOUNT_TB 테이블과 매핑되는 어드민 정보 VO 클래스
 * == 수정 정보 ==
 *
 * DATE          AUTHOR         NOTE
 * -------      --------         -------------   
 * 20.07.27      손예린            테이블 명세서에 따른 초기세팅
 * 20.08.03		  손예린	 	계정상태 추가
 * 
 */

package com.nemo.admin.management.vo;

import lombok.Data;

@Data
public class ManagementVO {

	private int adminNo;
	private String adminId;
	private String adminPw;
	private String adminEmail;
	private String adminUse;
	

}