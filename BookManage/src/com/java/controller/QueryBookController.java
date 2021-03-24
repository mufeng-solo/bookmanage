package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.entity.Book;
import com.java.entity.Constant;
import com.java.entity.Data;
import com.java.entity.Page;
import com.java.entity.Temp;
import com.java.service.BookService;
import com.java.service.DataService;

@Controller
@RequestMapping("query")
public class QueryBookController {
	
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	@Autowired
	@Qualifier("dataService")
	DataService dataService;
	

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}
	
	/* 分页查询书籍 */
	@RequestMapping("book/{currentPage}")
	public String queryBookByPage(@PathVariable("currentPage") String cPage,Model model) {
		
		//将分页所需的5个字段（其中有一个自动计算）组装到Page对象中
		Page page = new Page();
		if(cPage==null) {
			cPage="0";
		}
		int currentPage = Integer.parseInt(cPage);
		page.setCurrentPage(currentPage);//1
		/*currentPage:当前页（页码）
		 * 
		 * books：当前页的数据集合
		 * */
		int totalCount = bookService.getTotalCount();//数据总数
		page.setTotalCount(totalCount);//2
		
		Data data = dataService.queryData(1);
		int pageSize = data.getPagesize();
		page.setPageSize(pageSize);//3
		Temp temp = new Temp();
		temp.setNum1(currentPage*pageSize);
		temp.setNum2(pageSize);
		List<Book> books = bookService.queryBookByPage(temp);
		page.setBooks(books);//4
		
		model.addAttribute("page", page);
		//加入还书期限
		model.addAttribute("returndate", data.getReturndate());
		model.addAttribute("fine", data.getFine());
		return "book_lending";
	}
	
}
