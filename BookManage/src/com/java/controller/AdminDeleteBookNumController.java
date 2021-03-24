package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.entity.Constant;
import com.java.service.BookService;

@Controller
@RequestMapping("admin")
public class AdminDeleteBookNumController {
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	/* 管理员删除图书 */
	@RequestMapping("deletebooknum/{id}")
	public String adminAddBookNum(@PathVariable("id") Integer id,Model model) {
		
		bookService.adminDeleteBookNum(id);
		
		int temp = id%Constant.PAGE_SIZE;
		int page = (id-temp)/Constant.PAGE_SIZE;
		if(temp==0)
			page -= 1;
		return "redirect:../../book/manage/"+page;
	}
}
