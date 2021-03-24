package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.entity.Admin;
import com.java.entity.Data;
import com.java.service.AdminService;
import com.java.service.DataService;

@SessionAttributes({"admininfo","admin","style"})
@Controller
@RequestMapping("admin")
public class AdminLoginController {
	
	@Autowired
	@Qualifier("adminService")
	AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Autowired
	@Qualifier("dataService")
	DataService dataService;
	

	public void setDataService(DataService dataService) {
		this.dataService = dataService;
	}
	
	/* 管理员登录 */
	@RequestMapping("queryAdminByAname")
	public String queryAdminByAname(@RequestParam("aname") String name,@RequestParam("apwd") String pwd,Model model) {
		
		Admin admin = adminService.queryAdminByAname(name);
		//获取系统style
		Data data = dataService.queryData(1);
		String style = data.getStyle();
		if(admin!=null) {
			if(pwd.equals(admin.getApwd())) {
				model.addAttribute("admininfo", "login");
				model.addAttribute("admin",name);
				model.addAttribute("style", style);
			}else{
				model.addAttribute("admininfo", "error");
				return "redirect:/admin_login.jsp";
			}
		}else {
			model.addAttribute("admininfo", "error");
			return "redirect:/admin_login.jsp";
		}
		return "manage";
	}
}
