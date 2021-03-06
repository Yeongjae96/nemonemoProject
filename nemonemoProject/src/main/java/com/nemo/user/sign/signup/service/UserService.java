package com.nemo.user.sign.signup.service;

import java.util.List;

import com.nemo.user.sign.signup.vo.UserBaseVO;
import com.nemo.user.sign.signup.vo.UserTermsVO;

public interface UserService {
	public int insertUser(UserBaseVO vo);
	public int updateUser(UserBaseVO vo);
	public int withdrawUser(UserBaseVO vo);
	public UserBaseVO getUser(int userNo);
	public List<UserBaseVO> getUserList();
	public UserBaseVO loginUser(UserBaseVO vo);
	public int idUsercheck(String UserEmail);
	public int addSocialUser(UserBaseVO vo);
	public UserBaseVO getSocialUser(UserBaseVO vo);
//	public int insertUserTerms(UserTermsVO vo);
}
