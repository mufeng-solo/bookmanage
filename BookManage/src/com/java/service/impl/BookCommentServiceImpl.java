package com.java.service.impl;

import java.util.List;

import com.java.entity.BookComment;
import com.java.mapper.BookCommentMapper;
import com.java.service.BookCommentService;

public class BookCommentServiceImpl implements BookCommentService{

	BookCommentMapper bookCommentMapper;
	
	public void setBookCommentMapper(BookCommentMapper bookCommentMapper) {
		this.bookCommentMapper = bookCommentMapper;
	}

	@Override
	public void insertUserComment(BookComment comment) {
		bookCommentMapper.insertUserComment(comment);	
	}

	@Override
	public List<BookComment> queryUserComment(int id) {
		return bookCommentMapper.queryUserComment(id);
	}

}
