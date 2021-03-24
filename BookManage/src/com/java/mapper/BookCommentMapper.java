package com.java.mapper;

import java.util.List;

import com.java.entity.BookComment;

public interface BookCommentMapper {
	void insertUserComment(BookComment comment);
	
	List<BookComment> queryUserComment(int id);
}
