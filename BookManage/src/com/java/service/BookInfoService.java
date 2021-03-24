package com.java.service;

import com.java.entity.BookInfo;

public interface BookInfoService {
	
	void insertBookinfoById(BookInfo bookInfo);
	
	BookInfo queryBookcomById(int id);
	
	void updateBookinfoById(BookInfo bookInfo);
}
