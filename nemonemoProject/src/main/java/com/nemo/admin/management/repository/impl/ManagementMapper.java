package com.nemo.admin.management.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.admin.management.repository.IManagementMapper;
import com.nemo.admin.management.vo.ManagementVO;

@Mapper
public interface ManagementMapper extends IManagementMapper{
	public int idCheck(String adminId);
}


