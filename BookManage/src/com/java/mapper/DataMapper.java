package com.java.mapper;

import com.java.entity.Data;

public interface DataMapper {

	Data queryData(int id);
	
	void updatePagesize(int pagesize);
	
	void updateReturnDate(int returndate);
	
	void updateFine(int fine);
	
	void updateStyle(String style);
}
