package com.nemo.admin.management.repository.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.admin.management.repository.ManagementDAO;
import com.nemo.admin.management.vo.ManagementVO;

@Repository
public class ManagementDAOMybatis implements ManagementDAO{
	@Autowired
	private SqlSessionTemplate session;	
	//private ManagementDAO managementDAO;
	
	// 앞으로 아래에 차례대로 구현될 것임

	@Override
	public int insertAdmin(ManagementVO vo) {
		System.out.println("DAO : " + vo);
		
		return session.insert("com.nemo.admin.management.repository.impl.ManagementDAOMybatis.insertAdmin", vo);

	}

	@Override
	public ManagementVO loginAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

}

