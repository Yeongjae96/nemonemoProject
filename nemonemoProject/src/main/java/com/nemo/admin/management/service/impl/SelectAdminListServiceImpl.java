package com.nemo.admin.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.SelectAdminListService;
import com.nemo.admin.management.vo.ManagementVO;

@Service
public class SelectAdminListServiceImpl implements SelectAdminListService{

	@Autowired 
	private ManagementMapper managementDAO;

	@Override
	public List<ManagementVO> getAdminList(ManagementVO vo) {
		return managementDAO.getAdminList(vo);
	}

}
