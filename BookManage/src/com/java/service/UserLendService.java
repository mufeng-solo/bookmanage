package com.java.service;

import java.util.List;

import com.java.entity.UserLendBook;

public interface UserLendService {
	
	void userLend(UserLendBook userLend);
	
	void userReturn(UserLendBook userLend);
	
	String queryReturnDate(UserLendBook userLend);
	
	List<UserLendBook> queryAllInfo();
	
	List<UserLendBook> queryAllInfoOrderByName();
}
