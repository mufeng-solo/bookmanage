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
@SessionAttributes(value= {"info","user"})
@Controller
@RequestMapping("login_contro")
public class UserLoginController {
	
	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/* �û���¼ */
	@RequestMapping("queryUserByUname")
	public String queryUserByUname(@RequestParam("uname") String name,@RequestParam("upwd") String pwd,Model model) {
		User user = userService.queryUserByUname(name);
		if(user!=null) {
			pwd = SecurityUtil.md5Encode(pwd.getBytes());//md5����
			if(pwd.equals(user.getuPwd())) {
				model.addAttribute("info", "login");
				model.addAttribute("user",name);
				//��ӵ�¼״̬
				userService.userLogin(name);
			}else{
				model.addAttribute("info", "error");
				return "redirect:/user_login.jsp";
			}
		}else {
			model.addAttribute("info", "error");
			return "redirect:/user_login.jsp";
		}
		return "result";
	}
	
	/* �û���¼ AJAXʵ��*/
	@RequestMapping("ajax")
	@ResponseBody
	public String loginByAjax(HttpServletRequest request, HttpServletResponse response,Model model) {
		String name = request.getParameter("uname");
		String pwd = request.getParameter("upwd");
		User user = userService.queryUserByUname(name);
		String flag = "true";
		if(user!=null) {
			pwd = SecurityUtil.md5Encode(pwd.getBytes());//md5����
			if(pwd.equals(user.getuPwd())) {
				model.addAttribute("info", "login");
				model.addAttribute("user",name);
				//��ӵ�¼״̬
				userService.userLogin(name);
			}else{
				flag = "false";
				return flag;
			}
		}else {
			flag = "false";
			return flag;
		}
		return flag;
	}	
}
