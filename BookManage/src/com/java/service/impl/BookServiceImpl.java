package com.java.service.impl;

import java.util.List;

import com.java.entity.Book;
import com.java.entity.Temp;
import com.java.mapper.BookMapper;
import com.java.service.BookService;

public class BookServiceImpl implements BookService{
	private BookMapper bookMapper;
	
	public void setBookMapper(BookMapper bookMapper) {
		this.bookMapper = bookMapper;
	}

	@Override
	public List<Book> queryBookByPage(Temp temp) {
		return bookMapper.queryBookByPage(temp);
	}

	@Override
	public int getTotalCount() {
		return bookMapper.getTotalCount();
	}

	@Override
	public void adminAddBookNum(int id) {
		bookMapper.adminAddBookNum(id);
	}

	@Override
	public void adminDeleteBookNum(int id) {
		bookMapper.adminDeleteBookNum(id);
	}

	@Override
	public void adminAddBook(Book book) {
		bookMapper.adminAddBook(book);
	}

	@Override
	public void userLendBook(int id) {
		bookMapper.userLendBook(id);
	}

	@Override
	public String queryBooknameById(int id) {
		return bookMapper.queryBooknameById(id);
	}

	@Override
	public List<Book> userSearchBook(String bookname) {
		return bookMapper.userSearchBook(bookname);
	}

	@Override
	public Book queryBookByBookname(String bookname) {
		return bookMapper.queryBookByBookname(bookname);
	}

	@Override
	public void userReturnBook(int id) {
		bookMapper.userReturnBook(id);
	}

	@Override
	public List<Book> userSearchBookByAuthor(String author) {
		return bookMapper.userSearchBookByAuthor(author);
	}

	@Override
	public List<Book> queryAllBookByLendDesc() {
		return bookMapper.queryAllBookByLendDesc();
	}
	
	
}
