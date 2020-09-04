package com.nemo.user.sign.signup.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nemo.user.sign.signup.repository.impl.UserMapper;
import com.nemo.user.sign.signup.service.UserService;
import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.sign.signup.vo.UserTermsVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDAO;
	
	
	@Override
	public int insertUser(UserBaseVO vo) {
		return userDAO.insertUser(vo);
	}

//	@Override
//	public int insertUserTerms(UserTermsVO vo) {
//		vo.setTermAgreeYmd(new Date(System.currentTimeMillis()));
//		return userDAO.insertUserTerms(vo);
//	}
	
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

	@Override
	public int addSocialUser(UserBaseVO vo) {
		// TODO Auto-generated method stub
		return userDAO.addSocialUser(vo);
	}

	@Override
	public UserBaseVO getSocialUser(UserBaseVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getSocialUser(vo);
	}



}
