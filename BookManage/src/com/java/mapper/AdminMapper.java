package com.java.mapper;

import java.util.List;

import com.java.entity.Admin;

public interface AdminMapper {
	Admin queryAdminByAname(String aname);
	
	List<Admin> queryAllAdmin();
	
	void deleteManager(String aname);
	
	void addManager(Admin admin);
}
