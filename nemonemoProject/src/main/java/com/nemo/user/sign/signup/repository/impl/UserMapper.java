package com.nemo.user.sign.signup.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.sign.signup.repository.IUserMapper;
import com.nemo.user.sign.signup.vo.UserBaseVO;

@Mapper
public interface UserMapper extends IUserMapper {
	public int idUsercheck(String UserEmail);
	public int addSocialUser(UserBaseVO vo);
	public UserBaseVO getSocialUser(UserBaseVO vo);
}
