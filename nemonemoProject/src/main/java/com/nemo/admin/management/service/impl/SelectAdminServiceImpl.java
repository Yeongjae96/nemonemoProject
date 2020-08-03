package com.nemo.admin.management.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.SelectAdminService;
import com.nemo.admin.management.vo.ManagementVO;

@Service
public class SelectAdminServiceImpl implements SelectAdminService{

	@Autowired 
	private ManagementMapper managementDAO;

	@Override
	public ManagementVO getAdmin(String adminId) {
		return managementDAO.getAdmin(adminId);
	}

}
