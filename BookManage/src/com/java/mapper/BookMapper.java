package com.java.mapper;

import java.util.List;

import com.java.entity.Book;
import com.java.entity.Temp;

public interface BookMapper {

	List<Book> queryBookByPage(Temp temp);
	
	int getTotalCount();
	
	void adminAddBookNum(int id);
	
	void adminDeleteBookNum(int id);
	
	void adminAddBook(Book book);
	
	void userLendBook(int id);
	
	String queryBooknameById(int id);
	
	List<Book> userSearchBook(String bookname);
	
	List<Book> userSearchBookByAuthor(String author);
	
	Book queryBookByBookname(String bookname);
	
	void userReturnBook(int id);
	
	List<Book> queryAllBookByLendDesc();
}
