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
	
	/* ��ҳ��ѯ�鼮 */
	@RequestMapping("book/{currentPage}")
	public String queryBookByPage(@PathVariable("currentPage") String cPage,Model model) {
		
		//����ҳ�����5���ֶΣ�������һ���Զ����㣩��װ��Page������
		Page page = new Page();
		if(cPage==null) {
			cPage="0";
		}
		int currentPage = Integer.parseInt(cPage);
		page.setCurrentPage(currentPage);//1
		/*currentPage:��ǰҳ��ҳ�룩
		 * 
		 * books����ǰҳ�����ݼ���
		 * */
		int totalCount = bookService.getTotalCount();//��������
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
		//���뻹������
		model.addAttribute("returndate", data.getReturndate());
		model.addAttribute("fine", data.getFine());
		return "book_lending";
	}
	
}
