package com.java.entity;

import java.util.List;

//分页帮助类
public class Page {
//	当前页 currentPage
	private int currentPage;
//	页面大小 pageSize
	private int pageSize;
//	总数据量 totalCount
	private int totalCount;
//	总页数 totalPage
	private int totalPage;
//	当前页的数据集合 books
	private List<Book> books;
	
	public Page() {
	}
	public Page(int currentPage, int pageSize, int totalCount, int totalPage, List<Book> books) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.books = books;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	/*
 	总页数= 数据总数%页面大小==0？（数据总数/页面大小）:（数据总数/页面大小+1）
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		//自动计算出总页数(务必注意顺序)先set总数据数 再set页面大小
		this.totalPage = this.totalCount%this.pageSize==0 ? this.totalCount/this.pageSize : this.totalCount/this.pageSize + 1;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	//给总页数赋值
//	public void setTotalPage(int totalPage) {
//		this.totalPage = totalPage;
//	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", books=" + books + "]";
	}
	
}