package com.nemo.user.sign.signup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.ContextUtil;
import com.nemo.user.sign.signup.repository.impl.UserMapper;
import com.nemo.user.sign.signup.service.UserService;
import com.nemo.user.sign.signup.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDAO;
	
	@Override
	public int insertUser(UserVO vo) {
		return userDAO.insertUser(vo);
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
	public int login(UserVO vo) {
		
		String userPassword = vo.getUserPw();
		String DBpassword = userDAO.getPass(vo.getUserPhone());
		System.out.println("serviceParameter: " + vo.getUserPw());
		System.out.println("db: " + DBpassword);
		int result = 0;
		
		if(userPassword.equals(DBpassword)) {
			ContextUtil.setAttrToSession("userPhone", vo.getUserPhone());
			System.out.println("service : " + vo.getUserPhone());
			result = 1;
		}
		
		return result;
	}

}
