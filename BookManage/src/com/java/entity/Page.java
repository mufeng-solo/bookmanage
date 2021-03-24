package com.java.entity;

import java.util.List;

//��ҳ������
public class Page {
//	��ǰҳ currentPage
	private int currentPage;
//	ҳ���С pageSize
	private int pageSize;
//	�������� totalCount
	private int totalCount;
//	��ҳ�� totalPage
	private int totalPage;
//	��ǰҳ�����ݼ��� books
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
 	��ҳ��= ��������%ҳ���С==0������������/ҳ���С��:����������/ҳ���С+1��
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		//�Զ��������ҳ��(���ע��˳��)��set�������� ��setҳ���С
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
	//����ҳ����ֵ
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