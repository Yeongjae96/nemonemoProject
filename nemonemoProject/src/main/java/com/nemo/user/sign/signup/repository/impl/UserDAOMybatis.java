package com.nemo.user.sign.signup.repository.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nemo.user.sign.signup.repository.UserDAO;
import com.nemo.user.sign.signup.vo.UserVO;

@Repository
public class UserDAOMybatis implements UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertUser(UserVO vo) {
		System.out.println(vo);
		return session.insert("com.nemo.user.sign.signup.repository.impl.UserDAOMybatis.insertUser",vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO getUser(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String getPass(String userPhone) {
		String pass = session.selectOne("com.nemo.user.sign.signup.repository.impl.UserDAOMybatis.getPass", userPhone);
		System.out.println("DAO : " + pass);
		System.out.println("DAO parameter: " + userPhone);
		return pass;
	
	}

}
