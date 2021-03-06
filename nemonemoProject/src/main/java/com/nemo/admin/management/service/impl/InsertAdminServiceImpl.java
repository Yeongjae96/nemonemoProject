package com.nemo.admin.management.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.InsertAdminService;
import com.nemo.admin.management.vo.ManagementVO;

@Service
public class InsertAdminServiceImpl implements InsertAdminService{
	
	@Autowired
	private ManagementMapper managementDAO;
	
	@Override
	public int insertAdmin(ManagementVO vo) {
		return managementDAO.insertAdmin(vo);
	}

	
}
