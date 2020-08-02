package com.nemo.admin.management.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.nemo.admin.management.repository.impl.ManagementMapper;
import com.nemo.admin.management.service.GetAdminListService;
import com.nemo.admin.management.vo.ManagementVO;

public class GetAdminListServiceImpl implements GetAdminListService{

	@Autowired 
	private ManagementMapper managementDAO;

	@Override
	public List<ManagementVO> getAdminList(ManagementVO vo) {
		return managementDAO.getAdminList(vo);
	}

}
