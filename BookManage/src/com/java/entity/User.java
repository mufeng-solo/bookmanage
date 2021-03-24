package com.java.entity;

public class User {
	private int id;
	private String uName;
	private String uPwd;
	private String lendBook;
	private String isLogin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getLendBook() {
		return lendBook;
	}
	public void setLendBook(String lendBook) {
		this.lendBook = lendBook;
	}
	public String getIsLogin() {
		return isLogin;
	}
	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}
	
	
}
