package com.java.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.entity.SecurityUtil;
import com.java.entity.User;
import com.java.service.UserService;

@SessionAttributes(value= {"reinfo","user","info"})
@Controller
@RequestMapping("register_contro")
public class UserRegisterController {
	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/* 用户注册 */
	@RequestMapping("UserRegister")
	public String UserRegister(@RequestParam("uname") String name,@RequestParam("upwd") String pwd,Model model) {
		User user = userService.queryUserByUname(name);
		if(!name.equals("")&&!pwd.equals("")) {
			if(user==null) {
				//注册
				User user2 = new User();
				user2.setuName(name);
				pwd = SecurityUtil.md5Encode(pwd.getBytes());//md5加密
				user2.setuPwd(pwd);
				user2.setLendBook("");
				user2.setIsLogin("true");
				userService.addUser(user2);
				model.addAttribute("info", "login");
				model.addAttribute("user",name);
				return "result";
			}else {
				model.addAttribute("reinfo", "error");
				return "redirect:/user_register.jsp";
			}
		}else {
			model.addAttribute("reinfo", "nullerror");
			return "redirect:/user_register.jsp";
		}
	}
	
	/* 用户注册Ajax */
	@RequestMapping("ajax")
	@ResponseBody
	public String UserRegisterByAjax(HttpServletRequest request, HttpServletResponse response,Model model) {
		String name = request.getParameter("rname");
		String pwd = request.getParameter("rpwd");
		User user = userService.queryUserByUname(name);
		if(!name.equals("")&&!pwd.equals("")) {
			if(user==null) {
				//注册
				User user2 = new User();
				user2.setuName(name);
				pwd = SecurityUtil.md5Encode(pwd.getBytes());//md5加密
				user2.setuPwd(pwd);
				user2.setLendBook("");
				user2.setIsLogin("true");
				userService.addUser(user2);
				System.out.println("注册成功");
				model.addAttribute("info", "login");
				model.addAttribute("user",name);
				return "success";
			}else {
				return "error1";
			}
		}
		return "error2";
	}
	
}
