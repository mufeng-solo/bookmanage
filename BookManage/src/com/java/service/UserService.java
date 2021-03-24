package com.java.service;

import java.util.List;

import com.java.entity.User;

public interface UserService {

	User queryUserByUname(String uname);
	
	public void addUser(User user);
	
	public void updateUserLendbook(User user);
	
	List<User> queryAllUser();
	
	void userLogin(String uname);
	
	void userLogout(String uname);
	
	List<User> queryUserOnline();
	
	void forceLogout();
}
