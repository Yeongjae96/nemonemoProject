package com.nemo.user.sign.signup.repository.impl;

import org.apache.ibatis.annotations.Mapper;

import com.nemo.user.sign.signup.repository.IUserMapper;

@Mapper
public interface UserMapper extends IUserMapper {
	public int idUsercheck(String UserEmail);
	
}
