package com.java.mapper;

import java.util.List;

import com.java.entity.UserLendBook;

public interface UserLendMapper {
	void userLend(UserLendBook userLend);
	
	void userReturn(UserLendBook userLend);
	
	String queryReturnDate(UserLendBook userLend);
	
	List<UserLendBook> queryAllInfo();
	
	List<UserLendBook> queryAllInfoOrderByName();
}
