package com.java.service.impl;

import java.util.List;

import com.java.entity.Admin;
import com.java.mapper.AdminMapper;
import com.java.service.AdminService;

public class AdminServiceImpl implements AdminService{
	private AdminMapper adminMapper;
	
	
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}


	@Override
	public Admin queryAdminByAname(String aname) {
		return adminMapper.queryAdminByAname(aname);
	}


	@Override
	public List<Admin> queryAllAdmin() {
		return adminMapper.queryAllAdmin();
	}


	@Override
	public void deleteManager(String aname) {
		adminMapper.deleteManager(aname);
	}


	@Override
	public void addManager(Admin admin) {
		adminMapper.addManager(admin);
	}

}
