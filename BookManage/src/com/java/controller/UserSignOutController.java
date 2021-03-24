package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.service.UserService;

/*
 * 用户退出
*/
@SessionAttributes(value= {"info"})
@Controller
@RequestMapping("sign_out_contro")
public class UserSignOutController {
	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("userSignOut1")
	public String userSignOut1(@RequestParam("uname") String uname,Model model) {
		model.addAttribute("info","null");
		//添加离线状态
		userService.userLogout(uname);
		return "result";
	}
	
	@RequestMapping("userSignOut2")
	public String userSignOut2(@RequestParam("uname") String uname,Model model) {
		model.addAttribute("info","null");
		//添加离线状态
		userService.userLogout(uname);
		return "redirect:../query/book/0";
	}
	
	@RequestMapping("userSignOut3")
	public String userSignOut3(@RequestParam("uname") String uname,Model model) {
		model.addAttribute("info","null");
		//添加离线状态
		userService.userLogout(uname);
		return "book_download";
	}
	
	@RequestMapping("userSignOut4")
	public String userSignOut4(@RequestParam("uname") String uname,Model model) {
		model.addAttribute("info","null");
		//添加离线状态
		userService.userLogout(uname);
		return "book_returning";
	}
}
