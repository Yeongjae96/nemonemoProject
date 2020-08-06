package com.nemo.admin.management.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.DeleteAdminService;
import com.nemo.admin.management.vo.ManagementVO;

@Service
public class DeleteAdminServiceImpl implements DeleteAdminService{
	
	@Autowired
	private ManagementMapper managementDAO;

	@Override
	public int deleteAdmin(ManagementVO vo) {
		return managementDAO.deleteAdmin(vo);
	}


	
	
}
