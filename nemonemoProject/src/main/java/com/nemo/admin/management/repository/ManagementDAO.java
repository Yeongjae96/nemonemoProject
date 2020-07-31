package com.nemo.admin.management.repository;

import com.nemo.admin.management.vo.ManagementVO;

public interface ManagementDAO {
	
	// 회원 가입
	public int insertAdmin(ManagementVO vo);
	// 로그인
	public ManagementVO loginAdmin(int adminNo);

}
