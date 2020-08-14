package com.nemo.user.sign.signup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nemo.common.util.ContextUtil;
import com.nemo.user.sign.signup.repository.impl.UserMapper;
import com.nemo.user.sign.signup.service.UserService;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDAO;
	
	@Override
	public int insertUser(UserBaseVO vo) {
		return userDAO.insertUser(vo);
	}

	@Override
	public int updateUser(UserBaseVO vo) {
		// TODO Auto-generated method stub
		return userDAO.updateUser(vo);
	}

	@Override
	public UserBaseVO getUser(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserBaseVO> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public UserBaseVO loginUser(UserBaseVO vo) {
		return userDAO.loginUser(vo);
	}

	@Override
	public int idUsercheck(String UserEmail) {
		// TODO Auto-generated method stub
		return userDAO.idUsercheck(UserEmail);
	}

	@Override
	public int withdrawUser(UserBaseVO vo) {
		// TODO Auto-generated method stub
		return userDAO.withdrawUser(vo);
	}



}
