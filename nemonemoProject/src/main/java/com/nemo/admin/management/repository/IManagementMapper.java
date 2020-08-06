package com.nemo.admin.management.repository;

import java.util.List;

import com.nemo.admin.management.vo.ManagementVO;

public interface IManagementMapper {
	
	public int insertAdmin(ManagementVO vo);
	public ManagementVO loginAdmin(ManagementVO vo);
	public int deleteAdmin(ManagementVO vo);
	public int updateAdmin(ManagementVO vo);
	public ManagementVO getAdmin(String adminId);
	public List<ManagementVO> getAdminList(ManagementVO vo);

}
