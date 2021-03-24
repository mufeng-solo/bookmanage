package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.BookComment;
import com.java.entity.BookInfo;
import com.java.service.BookCommentService;
import com.java.service.BookInfoService;
import com.java.service.BookService;

@Controller
@RequestMapping("admin")
public class AdminManageBookInfoContro {

	@Autowired
	@Qualifier("bookInfoService")
	BookInfoService bookInfoService;

	public void setBookInfoService(BookInfoService bookInfoService) {
		this.bookInfoService = bookInfoService;
	}
	
	@Autowired
	@Qualifier("bookCommentService")
	BookCommentService bookCommentService;

	public void setBookCommentService(BookCommentService bookCommentService) {
		this.bookCommentService = bookCommentService;
	}
	
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	/* 更改图书信息 */
	@RequestMapping("updateBookInfo")
	public String adminUpdateBookInfo(@RequestParam("bookid") Integer bookid,@RequestParam("bookinfo") String bookinfo,Model model) {
		if(bookInfoService.queryBookcomById(bookid)!=null) {
			//更改信息
			BookInfo bookInfo = new BookInfo();
			bookInfo.setId(bookid);
			bookInfo.setInfo(bookinfo);
			bookInfoService.updateBookinfoById(bookInfo);
		}else {
			//增加信息
			BookInfo bookInfo = new BookInfo();
			bookInfo.setId(bookid);
			bookInfo.setInfo(bookinfo);
			bookInfoService.insertBookinfoById(bookInfo);
		}
		
		return "redirect:../book/manage/0";
	}

	/* 获取图书信息 */
	@RequestMapping("getBookInfo/{id}")
	public String adminGetBookInfo(@PathVariable("id") Integer id,Model model) {
		String bookName = bookService.queryBooknameById(id);
		model.addAttribute("bookname", bookName);
		if(bookInfoService.queryBookcomById(id)!=null) {
			BookInfo bookinfo = bookInfoService.queryBookcomById(id);
			model.addAttribute("bookinfo", bookinfo);
			model.addAttribute("bookid", id);
		}else {
			model.addAttribute("bookid", id);
		}
		
		/* 查询用户评论 */
		if(bookCommentService.queryUserComment(id)!=null) {
			List<BookComment> bookComments = bookCommentService.queryUserComment(id);
			model.addAttribute("bookcomment", bookComments);
		}
		return "manage_bookinfo";
	}
}
