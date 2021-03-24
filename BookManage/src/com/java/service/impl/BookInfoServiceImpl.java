package com.java.service.impl;

import com.java.entity.BookInfo;
import com.java.mapper.BookInfoMapper;
import com.java.service.BookInfoService;

public class BookInfoServiceImpl implements BookInfoService{
	
	BookInfoMapper bookInfoMapper;

	public void setBookInfoMapper(BookInfoMapper bookInfoMapper) {
		this.bookInfoMapper = bookInfoMapper;
	}

	@Override
	public void insertBookinfoById(BookInfo bookInfo) {
		bookInfoMapper.insertBookinfoById(bookInfo);
		
	}

	@Override
	public BookInfo queryBookcomById(int id) {
		return bookInfoMapper.queryBookcomById(id);
	}

	@Override
	public void updateBookinfoById(BookInfo bookInfo) {
		bookInfoMapper.updateBookinfoById(bookInfo);
		
	}
	
	
}
