package com.java.mapper;

import com.java.entity.BookInfo;

public interface BookInfoMapper {
	
	void insertBookinfoById(BookInfo bookInfo);
	
	BookInfo queryBookcomById(int id);
	
	void updateBookinfoById(BookInfo bookInfo);

}
