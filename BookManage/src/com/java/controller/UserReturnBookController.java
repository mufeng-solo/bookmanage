package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.Book;
import com.java.entity.Data;
import com.java.entity.User;
import com.java.entity.UserLendBook;
import com.java.service.BookService;
import com.java.service.DataService;
import com.java.service.UserLendService;
import com.java.service.UserService;

@Controller
@RequestMapping("return")
public class UserReturnBookController {
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	@Qualifier("userLendService")
	UserLendService userLendBook;

	public void setUserLendBook(UserLendService userLendBook) {
		this.userLendBook = userLendBook;
	}
	
	@Autowired
	@Qualifier("dataService")
	DataService dataService;
	

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}
	
	/* 还书界面 */
	@RequestMapping("book")
	public String userLendBook(@RequestParam("username") String username,Model model) {
		User user = userService.queryUserByUname(username);
		String lendBook = user.getLendBook();
		String[] booksId = lendBook.split("-");
		String[] books = new String[20];
		String[] returnDates = new String[20];//创建还书日期的数组
		if(!lendBook.equals("")){
			int i,j=0;
			for(String str : booksId) {
				try {
					i = Integer.parseInt(str);
					
					UserLendBook userLend = new UserLendBook();
					userLend.setUserName(username);
					userLend.setBookId(i);
					userLend.setReturnDate("");
					String returnDate = userLendBook.queryReturnDate(userLend);//根据用户名和书id查询还书日期
					returnDates[j]=returnDate;//还书日期存入数组
					
					String bookName = bookService.queryBooknameById(i);
					books[j]=bookName;
					j++;
				}catch(Exception e) {
					
				}
			}
			//获取每天的罚金
			Data data = dataService.queryData(1);
			System.out.println("fine"+data.getFine());
			model.addAttribute("fine", data.getFine());
			model.addAttribute("returnDates", returnDates);
			model.addAttribute("books", books);
			model.addAttribute("count", j);
		}
		return "book_returning";
	}

	/* 点击还书触发事件 */
	@RequestMapping("book2")
	public String userLendBook2(@RequestParam("returnbookname") String bookname,@RequestParam("username") String username,Model model) {
		User user = userService.queryUserByUname(username);
		String lendBook = user.getLendBook();
		String[] booksId = lendBook.split("-");
		Book book = bookService.queryBookByBookname(bookname);//根据书名查询书籍
		String id = book.getBookId()+"";
		String newlendBook = "";
		for(String str : booksId) {
			if(!str.equals(id)) {
				newlendBook = newlendBook+str+"-";
			}
		}
		user.setLendBook(newlendBook);
		userService.updateUserLendbook(user);
		bookService.userReturnBook(book.getBookId());
		model.addAttribute("username", username);
		//还书操作
		UserLendBook userLend = new UserLendBook();
		userLend.setUserName(username);
		userLend.setBookId(book.getBookId());
		userLend.setReturnDate("");
		userLendBook.userReturn(userLend);
		return "forward:../return/book";
	}
}
