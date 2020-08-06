package com.nemo.admin.management.service;

import com.nemo.admin.management.vo.ManagementVO;


/**
 * @제목 : login서비스
 * @패키지이름 : com.nemo.admin.management.service
 * @파일이름 : LoginAdminService.java
 * @작성일 : 2020. 8. 3.
 * @이름 : kdk70
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 * 2020-08-03	김동균	로그인서비스
 */
public interface LoginAdminService {

	public ManagementVO loginAdmin(ManagementVO vo); 
}
