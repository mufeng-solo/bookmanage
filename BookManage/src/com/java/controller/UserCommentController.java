package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.BookComment;
import com.java.service.BookCommentService;

@Controller
@RequestMapping("user")
public class UserCommentController {
	
	@Autowired
	@Qualifier("bookCommentService")
	BookCommentService bookCommentService;

	public void setBookCommentService(BookCommentService bookCommentService) {
		this.bookCommentService = bookCommentService;
	}
	/*”√ªß∆¿¬€*/
	@RequestMapping("makeComment")
	public String userMakeComment(@RequestParam("bookid") Integer bookid,@RequestParam("username") String username,@RequestParam("comment") String comment,Model model) {
		
		BookComment bookComment = new BookComment();
		bookComment.setId(bookid);
		bookComment.setUserName(username);
		bookComment.setComment(comment);
		bookCommentService.insertUserComment(bookComment);
		return "redirect:../user/getBookInfo/"+bookid;
	}
	
}	
