package com.java.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.entity.Constant;
import com.java.entity.Data;
import com.java.entity.User;
import com.java.entity.UserLendBook;
import com.java.service.BookService;
import com.java.service.DataService;
import com.java.service.UserLendService;
import com.java.service.UserService;

@SessionAttributes({"lendbook","canotlend"})
@Controller
@RequestMapping("user")
public class UserLendBookController {
	
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

	/* 用户借书 */
	@RequestMapping("lendbook")
	public String userLendBook(@RequestParam("bookid") Integer bookid,@RequestParam("username") String username,Model model) {
		//用户处理
		boolean flag=true;
		User user = userService.queryUserByUname(username);
		
		String lendBook = user.getLendBook();
		if(!lendBook.equals("")){
			int i;
			String[] booksId = lendBook.split("-");
			for(String str : booksId) {
				i = Integer.parseInt(str);
				if(i==bookid) {
					flag=false;
				}
			}
			if(flag==true) {
				//增书操作
				String tempId=user.getLendBook()+bookid+"-";
				user.setLendBook(tempId);
				userService.updateUserLendbook(user);
				model.addAttribute("lendbook", "success");
				//书籍处理
				bookService.userLendBook(bookid);
				//增加借书记录
				//获取还书时间
				Calendar calendar = Calendar.getInstance();
				Data datas = dataService.queryData(1);
				int time = datas.getReturndate();
				calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + time);  
				String str = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(calendar.getTime());
				
				UserLendBook userLend = new UserLendBook();
				userLend.setUserName(username);
				userLend.setBookId(bookid);
				userLend.setReturnDate(str);
				userLendBook.userLend(userLend);
			}
		}else{
			//增书操作
			String tempId=user.getLendBook()+bookid+"-";
			user.setLendBook(tempId);
			userService.updateUserLendbook(user);
			model.addAttribute("lendbook", "success");
			//书籍处理
			bookService.userLendBook(bookid);
			//增加借书记录
			//获取还书时间
			Calendar calendar = Calendar.getInstance();
			Data datas = dataService.queryData(1);
			int time = datas.getReturndate();
			calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + time); 
			String str = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(calendar.getTime());
			
			UserLendBook userLend = new UserLendBook();
			userLend.setUserName(username);
			userLend.setBookId(bookid);
			userLend.setReturnDate(str);
			userLendBook.userLend(userLend);
		}
		return "redirect:../query/book/0";
	}
}
