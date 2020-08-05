package com.nemo.admin.management.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.IdCheckService;
import com.nemo.admin.management.vo.ManagementVO;

@Service
public class IdCheckServiceImpl implements IdCheckService{

	@Autowired
	private ManagementMapper managementDAO;

	@Override
	public ManagementVO idCheck(String adminId) {
		return managementDAO.idCheck(adminId);
	}

	

}
