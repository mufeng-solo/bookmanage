package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.entity.User;
import com.java.service.UserService;
@SessionAttributes({"users"})
@Controller
@RequestMapping("admin")
public class AdminManageUser {

	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/* 用户管理 */
	@RequestMapping("manageUser")
	public String adminManageUser(Model model) {
		List<User> users = userService.queryAllUser();
		model.addAttribute("users", users);
		
		//查询在线用户
		List<User> onlineusers = userService.queryUserOnline();
		model.addAttribute("onlineusers", onlineusers);
		return "manage_user";
	}
}
