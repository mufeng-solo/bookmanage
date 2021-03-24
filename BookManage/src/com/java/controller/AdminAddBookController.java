package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.Book;
import com.java.service.BookService;

@Controller
@RequestMapping("admin")
public class AdminAddBookController {
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	/* 管理员增加图书 */
	@RequestMapping("addbook")
	public String adminAddBook(@RequestParam("bookname") String bookname,@RequestParam("booktype") String booktype,
			@RequestParam("press") String press,@RequestParam("author") String author,@RequestParam("price") Double price,@RequestParam("number") Integer number,
			@RequestParam("lend") Integer lend,@RequestParam("stock") Integer stock,@RequestParam("location") String location,Model model) {
		Book book = new Book();
		if(bookname!=null&&booktype!=null&&press!=null&&author!=null&&price!=null&&number!=null&&lend!=null&&stock!=null&&location!=null) {
			book.setBookName(bookname);
			book.setBookType(booktype);
			book.setPress(press);
			book.setAuthor(author);
			book.setPrice(price);
			book.setNumber(number);
			book.setLend(lend);
			book.setStock(stock);
			book.setLocation(location);
			bookService.adminAddBook(book);
			model.addAttribute("addbook","success");
		}else {
			model.addAttribute("addbook","error");
		}
		return "manage";
	}
	
	/* 管理员增加图书 */
    //springMVC自动将请求参数和入参对象的属性进行一一绑定
    //要求请求参数的名字和javabean入参的对象里面的属性名是一样的
	@RequestMapping("addbook2")
	public String adminAddBook2(Book book,Model model) {
		if(book.getBookName()!=null&&book.getBookType()!=null&&book.getPress()!=null&&book.getAuthor()!=null&&book.getPrice()!=0
				&&book.getNumber()!=0&&book.getLend()!=0&&book.getStock()!=0&&book.getLocation()!=null) {
			bookService.adminAddBook(book);
			model.addAttribute("addbook","success");
		}else {
			model.addAttribute("addbook","error");
		}
		return "manage";
	}
}
