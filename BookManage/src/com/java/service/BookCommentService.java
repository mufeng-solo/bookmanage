package com.java.service;

import java.util.List;

import com.java.entity.BookComment;

public interface BookCommentService {
	void insertUserComment(BookComment comment);
	
	List<BookComment> queryUserComment(int id);
}
