package com.nemo.admin.management.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nemo.admin.management.vo.ManagementVO;


public interface IManagementMapper {
	
	public int insertAdmin(ManagementVO vo);
	public ManagementVO loginAdmin(ManagementVO vo);

	public int deleteAdmin(ManagementVO vo);
//	public int updateAdmin(ManagementVO vo);
//	public ManagementVO getAdmin(String adminId);

	public List<ManagementVO> getAdminList(ManagementVO vo);
	public int idCheck(String adminId);

}
