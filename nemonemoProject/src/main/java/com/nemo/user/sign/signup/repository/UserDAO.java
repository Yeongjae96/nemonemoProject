package com.nemo.user.sign.signup.repository;

import java.util.List;

import com.nemo.user.sign.signup.vo.UserVO;

public interface UserDAO {
	public int insertUser(UserVO vo);
	public int updateUser(UserVO vo);
	public int deleteUser(int userNo);
	public UserVO getUser(int userNo);
	public List<UserVO> getUserList();
	
	
	public String getPass(String userPhone);
}
