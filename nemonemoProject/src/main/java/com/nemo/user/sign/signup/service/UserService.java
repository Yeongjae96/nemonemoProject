package com.nemo.user.sign.signup.service;

import java.util.List;

import com.nemo.user.sign.signup.vo.UserBaseVO;

public interface UserService {
	public int insertUser(UserBaseVO vo);
	public int updateUser(UserBaseVO vo);
	public int deleteUser(int userNo);
	public UserBaseVO getUser(int userNo);
	public List<UserBaseVO> getUserList();
	public UserBaseVO loginUser(UserBaseVO vo);
	public int idUsercheck(String UserEmail);
}
