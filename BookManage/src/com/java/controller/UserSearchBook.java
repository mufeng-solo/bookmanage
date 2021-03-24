package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.entity.Book;
import com.java.service.BookService;
@SessionAttributes({"searchbooks","search"})
@Controller
@RequestMapping("search")
public class UserSearchBook {
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

		
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	/* 查询书籍 */
	@RequestMapping("book")
	public String bookManage(@RequestParam("searchname")String searchname,Model model) {
		if(!searchname.equals("")) {
			List<Book> books = bookService.userSearchBook(searchname);
			List<Book> books2 = bookService.userSearchBookByAuthor(searchname);
			books.addAll(books2);//将books2加入到books
			if(books!=null) {
				model.addAttribute("searchbooks", books);
				model.addAttribute("search", "success");
				System.out.println(books);
			}
		}else {
			model.addAttribute("search","fail");
		}
		return "redirect:../query/book/0";
	}
}
