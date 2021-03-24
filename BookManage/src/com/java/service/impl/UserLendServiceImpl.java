package com.java.service.impl;

import java.util.List;

import com.java.entity.UserLendBook;
import com.java.mapper.UserLendMapper;
import com.java.service.UserLendService;

public class UserLendServiceImpl implements UserLendService{

	
	UserLendMapper userLendMapper;
	
	public void setUserLendMapper(UserLendMapper userLendMapper) {
		this.userLendMapper = userLendMapper;
	}

	@Override
	public void userLend(UserLendBook userLend) {
		// TODO Auto-generated method stub
		userLendMapper.userLend(userLend);
	}

	@Override
	public void userReturn(UserLendBook userLend) {
		// TODO Auto-generated method stub
		userLendMapper.userReturn(userLend);
	}

	@Override
	public String queryReturnDate(UserLendBook userLend) {
		return userLendMapper.queryReturnDate(userLend);
	}

	@Override
	public List<UserLendBook> queryAllInfo() {
		return userLendMapper.queryAllInfo();
	}

	@Override
	public List<UserLendBook> queryAllInfoOrderByName() {
		return userLendMapper.queryAllInfoOrderByName();
	}

}
