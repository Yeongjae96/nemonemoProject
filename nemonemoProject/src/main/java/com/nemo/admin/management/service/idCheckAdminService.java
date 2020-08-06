package com.nemo.admin.management.service;

import com.nemo.admin.management.vo.ManagementVO;

/**
 * @제목 : title
 * @패키지이름 : com.nemo.admin.management.service
 * @파일이름 : idCheckAdminService.java
 * @작성일 : 2020. 8. 4.
 * @이름 : kdk70
 * @프로그램설명 : 
 * == 수정 정보 ==
 *
 * DATE		 AUTHOR			NOTE
 * -------	--------	-------------	
 */
public interface idCheckAdminService {
	public ManagementVO idCheck(String adminId) throws Exception;
}
