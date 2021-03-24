package com.java.service;

import java.util.List;

import com.java.entity.Admin;

public interface AdminService {
	Admin queryAdminByAname(String aname);
	
	List<Admin> queryAllAdmin();
	
	void deleteManager(String aname);
	
	void addManager(Admin admin);
}
