package com.nemo.admin.management.service;

import java.util.List;

import com.nemo.admin.management.vo.ManagementVO;

public interface SelectAdminListService {
	public List<ManagementVO> getAdminList(ManagementVO vo);

}
