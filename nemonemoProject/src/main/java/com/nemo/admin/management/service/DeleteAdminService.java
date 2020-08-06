package com.nemo.admin.management.service;

/**
 * @제목 : 약관 삭제 서비스 인터페이스
 * @패키지이름 : com.nemo.admin.management.service
 * @파일이름 : DeleteAdminService.java
 * @작성일 : 2020. 8. 01.
 * @이름 : Yerin
 * @프로그램설명 : 해당 어드민을 삭제하는 서비스 인터페이스
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------		-------------
 * 	20.08.01 	손예린			초기설정
 */

public interface DeleteAdminService {
	public void deleteAdmin(int adminNo);

}
