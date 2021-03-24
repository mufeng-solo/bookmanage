package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.entity.BookComment;
import com.java.entity.BookInfo;
import com.java.service.BookCommentService;
import com.java.service.BookInfoService;
import com.java.service.BookService;

@Controller
@RequestMapping("user")
public class UserGetBookinfoAndComContro {
	
	@Autowired
	@Qualifier("bookInfoService")
	BookInfoService bookInfoService;

	public void setBookInfoService(BookInfoService bookInfoService) {
		this.bookInfoService = bookInfoService;
	}
	
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	@Autowired
	@Qualifier("bookCommentService")
	BookCommentService bookCommentService;

	public void setBookCommentService(BookCommentService bookCommentService) {
		this.bookCommentService = bookCommentService;
	}
	
	@RequestMapping("getBookInfo/{id}")
	public String userGetInfo(@PathVariable("id") Integer id,Model model) {
		/* 获取书籍信息 */
		if(bookInfoService.queryBookcomById(id)!=null) {
			BookInfo bookinfo = bookInfoService.queryBookcomById(id);
			String bookName = bookService.queryBooknameById(id);
			model.addAttribute("bookinfo", bookinfo);
			model.addAttribute("bookid", id);
			model.addAttribute("bookname", bookName);
		}
		/* 查询用户评论 */
		if(bookCommentService.queryUserComment(id)!=null) {
			List<BookComment> bookComments = bookCommentService.queryUserComment(id);
			model.addAttribute("bookcomment", bookComments);
		}
		return "book_info";
	}
}
