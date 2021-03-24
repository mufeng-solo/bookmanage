package com.java.service;

import com.java.entity.Data;

public interface DataService {

	Data queryData(int id);
	
	void updatePagesize(int pagesize);
	
	void updateReturnDate(int returndate);
	
	void updateFine(int fine);
	
	void updateStyle(String style);
}
