package com.nemo.user.sign.signup.repository;

import java.util.List;

import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.sign.signup.vo.UserTermsVO;

public interface IUserMapper {
	public int insertUser(UserBaseVO vo);
//	public int insertUserTerms(UserTermsVO vo);
	public int updateUser(UserBaseVO vo);
	public int withdrawUser(UserBaseVO vo);
//	public UserBaseVO getUser(int userNo);
//	public List<UserVO> getUserList();
	
	public UserBaseVO loginUser(UserBaseVO vo);
}
