package com.nemo.admin.management.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.LoginAdminService;
import com.nemo.admin.management.vo.ManagementVO;


/**
 * @제목 : 로그인 서비스
 * @패키지이름 : com.nemo.admin.management.service.impl
 * @파일이름 : LoginAdminServiceImpl.java
 * @작성일 : 2020. 7. 31.
 * @이름 : kim
 * @프로그램설명 : /menagement/signin 로그인 서비스임플
 *  
 * == 수정 정보 ==
 *
 * DATE		 	AUTHOR			NOTE
 * -------		--------			-------------
 * 	20.07.31 	김동균				Login설정
 * 
 */

@Service
public class LoginAdminServiceImpl implements LoginAdminService {

	@Autowired
	private ManagementMapper managementDAO;
	
	@Override
	public ManagementVO loginAdmin(ManagementVO vo){
		System.out.println("serv : " + vo.toString());
		ManagementVO result = managementDAO.loginAdmin(vo);
		System.out.println("serv result : " + result);
		return result;
	}


}
