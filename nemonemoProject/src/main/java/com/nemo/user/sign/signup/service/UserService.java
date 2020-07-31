package com.nemo.user.sign.signup.service;

import java.util.List;

import com.nemo.user.sign.signup.vo.UserVO;

public interface UserService {
	public int insertUser(UserVO vo);
	public int updateUser(UserVO vo);
	public int deleteUser(int userNo);
	public UserVO getUser(int userNo);
	public List<UserVO> getUserList();
	
	public int login(UserVO vo);
}
