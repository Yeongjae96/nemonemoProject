package com.nemo.admin.management.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.GetAdminService;
import com.nemo.admin.management.vo.ManagementVO;

public class GetAdminServiceImpl implements GetAdminService{

	@Autowired 
	private ManagementMapper managementDAO;

	@Override
	public ManagementVO getAdmin(String adminId) {
		return managementDAO.getAdmin(adminId);
	}

}
