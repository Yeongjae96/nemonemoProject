package com.nemo.admin.management.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.DeleteAdminService;

@Service
public class DeleteAdminServiceImpl implements DeleteAdminService{
	
	@Autowired
	private ManagementMapper managementDAO;

	@Override
	public void deleteAdmin(int adminNo) {
		managementDAO.deleteAdmin(adminNo);
	}
	
	
}
