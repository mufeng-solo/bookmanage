package com.java.service.impl;

import java.util.List;

import com.java.entity.User;
import com.java.mapper.UserMapper;
import com.java.service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserMapper userMapper;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User queryUserByUname(String uname) {
		return userMapper.queryUserByUname(uname);
	}

	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
		
	}

	@Override
	public void updateUserLendbook(User user) {
		userMapper.updateUserLendbook(user);
	}

	@Override
	public List<User> queryAllUser() {
		
		return userMapper.queryAllUser();
	}

	@Override
	public void userLogin(String uname) {
		userMapper.userLogin(uname);
	}

	@Override
	public void userLogout(String uname) {
		userMapper.userLogout(uname);
	}

	@Override
	public List<User> queryUserOnline() {
		return userMapper.queryUserOnline();
	}

	@Override
	public void forceLogout() {
		userMapper.forceLogout();
	}

	
}
