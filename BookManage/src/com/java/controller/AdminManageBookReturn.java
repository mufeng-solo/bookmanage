package com.java.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.Admin;
import com.java.entity.Book;
import com.java.entity.Data;
import com.java.entity.User;
import com.java.entity.UserLendBook;
import com.java.service.AdminService;
import com.java.service.BookService;
import com.java.service.DataService;
import com.java.service.UserLendService;
import com.java.service.UserService;

@Controller
@RequestMapping("admin")
public class AdminManageBookReturn {
	
	@Autowired
	@Qualifier("bookService")
	BookService bookService;

		
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	@Autowired
	@Qualifier("adminService")
	AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Autowired
	@Qualifier("userLendService")
	UserLendService userLendService;
	
	
	public void setUserLendService(UserLendService userLendService) {
		this.userLendService = userLendService;
	}
	
	@Autowired
	@Qualifier("dataService")
	DataService dataService;
	
	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}

	@Autowired
	@Qualifier("userService")
	UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("return")
	public String userReturn(@RequestParam("ordermethod")String ordermethod,Model model) {
		//��ѯͼ��
		List<Book> books = bookService.queryAllBookByLendDesc();
		//��ѯ���й���Ա
		List<Admin> admins = adminService.queryAllAdmin();
		List<UserLendBook> lendInfos = new ArrayList<UserLendBook>();
		List<String> booksname = new ArrayList<String>();
		//��ȡ����
		Data data = dataService.queryData(1);
		int fine = data.getFine();
		if(ordermethod.equals("bytime")) {
			//��ѯ�û�����ͼ�����(���ݻ�����������)
			lendInfos = userLendService.queryAllInfo();
			for(UserLendBook lend:lendInfos) {
				String name = bookService.queryBooknameById(lend.getBookId());
				booksname.add(name);
			}
			
		}else if(ordermethod.equals("bytime2")){
			lendInfos = userLendService.queryAllInfo();
			for(UserLendBook lend:lendInfos) {
				String name = bookService.queryBooknameById(lend.getBookId());
				booksname.add(name);
			}
			model.addAttribute("showlend", "true");
		}else {
			//�����û��������ѯ
			lendInfos = userLendService.queryAllInfoOrderByName();
			for(UserLendBook lend:lendInfos) {
				String name = bookService.queryBooknameById(lend.getBookId());
				booksname.add(name);
			}
			model.addAttribute("showlend", "true");
		}
		model.addAttribute("fine", fine);
		model.addAttribute("admins", admins);
		model.addAttribute("bookDesc", books);
		model.addAttribute("lendinfos", lendInfos);
		model.addAttribute("booksname", booksname);
		return "manage_return";
	}
	
	@RequestMapping("delete")
	public String deleteManager(@RequestParam("name") String name,@RequestParam("manager") String manager,Model model) {
		//��ȡ����
		Data data = dataService.queryData(1);
		int fine = data.getFine();
		
		List<UserLendBook> lendInfos = new ArrayList<UserLendBook>();
		List<String> booksname = new ArrayList<String>();
		//��ѯ�û�����ͼ�����(���ݻ�����������)
		lendInfos = userLendService.queryAllInfo();
		for(UserLendBook lend:lendInfos) {
			String bookname = bookService.queryBooknameById(lend.getBookId());
			booksname.add(bookname);
		}
		
		if(manager.equals("admin")) {
			System.out.println("ɾ������Ա");
			adminService.deleteManager(name);
			model.addAttribute("deleteinfo", "success");
		}else {
			model.addAttribute("deleteinfo", "nopermission");
		}
		List<Book> books = bookService.queryAllBookByLendDesc();
		List<Admin> admins = adminService.queryAllAdmin();
		model.addAttribute("fine", fine);
		model.addAttribute("admins", admins);
		model.addAttribute("bookDesc", books);
		model.addAttribute("lendinfos", lendInfos);
		model.addAttribute("booksname", booksname);
		return "manage_return";
	}
	
	@RequestMapping("add")
	public String addManager(@RequestParam("name") String name,@RequestParam("pwd") String pwd,Model model) {
		System.out.println("��ӹ���Ա");
		//��ȡ����
		Data data = dataService.queryData(1);
		int fine = data.getFine();
		
		List<UserLendBook> lendInfos = new ArrayList<UserLendBook>();
		List<String> booksname = new ArrayList<String>();
		//��ѯ�û�����ͼ�����(���ݻ�����������)
		lendInfos = userLendService.queryAllInfo();
		for(UserLendBook lend:lendInfos) {
			String bookname = bookService.queryBooknameById(lend.getBookId());
			booksname.add(bookname);
		}
		
		String  operation = "true";
		List<Admin> admins = adminService.queryAllAdmin();
		if(name.equals("")||pwd.equals("")) {
			operation = "false";	
			model.addAttribute("addinfo", "error1");
		}
		for(Admin ad:admins) {
			if(ad.getAname().equals(name)) { 
				operation = "false";
				model.addAttribute("addinfo", "error2");
			}
		}
		if(operation.equals("true")) {
			//��ӹ���Ա
			Admin admin = new Admin();
			admin.setAname(name);
			admin.setApwd(pwd);
			adminService.addManager(admin);
			model.addAttribute("addinfo", "success");
		}
		
		List<Book> books = bookService.queryAllBookByLendDesc();
		admins = adminService.queryAllAdmin();
		model.addAttribute("fine", fine);
		model.addAttribute("admins", admins);
		model.addAttribute("bookDesc", books);
		model.addAttribute("lendinfos", lendInfos);
		model.addAttribute("booksname", booksname);
		return "manage_return";
	}
}
